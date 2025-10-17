resource "aws_ecs_cluster" "main" {
  name = "my-ecs-cluster"
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs-task-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy_attach" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "ecs_instance_role" {
  name = "myproject-ecs-instance-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role_policy" {
  role       = aws_iam_role.ecs_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_policy" "ecs_exec_secrets_policy" {
  name   = "ecs-exec-secrets-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["secretsmanager:GetSecretValue"]
        Resource = "arn:aws:secretsmanager:us-west-2:194704207902:secret:dockerhub-creds-lswBX1"
      },
      {
        Effect = "Allow"
        Action = ["kms:Decrypt"]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_exec_secrets_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = aws_iam_policy.ecs_exec_secrets_policy.arn
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecsInstanceProfile"
  role = aws_iam_role.ecs_instance_role.name
}

data "aws_ssm_parameter" "ecs_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}

resource "aws_ecs_task_definition" "static_site" {
  family                   = "static-site"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "static-site"
      image     = "elsuloda/my_app:v1-amd64"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          "protocol": "tcp"
        }
      ]
      repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:us-west-2:194704207902:secret:dockerhub-creds-lswBX1"
      }
    }
  ])
}

resource "aws_ecs_service" "static_service" {
  name            = "static-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.static_site.arn
  launch_type     = "EC2"
  desired_count   = 2


  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "static-site"
    container_port   = 80
  }
  deployment_controller {
    type = "ECS"
  }
  
  depends_on = [
    aws_lb_listener.http,
    aws_lb_listener.https,
    aws_lb_target_group.main
  ]
}

resource "aws_instance" "ecs" {
  count                = 2
  ami                  = data.aws_ssm_parameter.ecs_ami.value
  instance_type        = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.ecs_instance_profile.name
  subnet_id            = aws_subnet.priv[0].id
  security_groups      = [aws_security_group.template.id]

  user_data = <<-EOF
    #!/bin/bash
    echo "ECS_CLUSTER=${aws_ecs_cluster.main.name}" > /etc/ecs/ecs.config
  EOF
}
