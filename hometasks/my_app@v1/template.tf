# resource "aws_launch_template" "main" { 
#   image_id = data.aws_ami.amazon_linux_2023.id
#   instance_type = "t3.micro"
#   iam_instance_profile {
#   name = aws_iam_instance_profile.ecs_instance_profile.name
# }
#   network_interfaces {
#     subnet_id                   = aws_subnet.priv[0].id
#     associate_public_ip_address = true
#     security_groups = [aws_security_group.template.id]
#   }
#   user_data =  base64encode(<<EOF
# #!/bin/bash
# echo ECS_CLUSTER=${aws_ecs_cluster.main.name} >> /etc/ecs/ecs.config
# sudo systemctl enable --now ecs
# sudo yum update -y
# sudo yum install -y httpd
# sudo systemctl start httpd
# sudo systemctl enable httpd
# cd /tmp
# yum install git -y 
# git clone https://github.com/batyrkulova/python.scripts.git
# sudo cp /tmp/python.scripts/index.html /var/www/html/
# sudo cp /tmp/python.scripts/script.js /var/www/html/
# sudo cp /tmp/python.scripts/style.css /var/www/html/
# EOF
#   )
# }
# resource "aws_iam_role" "ecs_instance_role" {
#   name = "myproject-ecs-instance-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Effect = "Allow",
#       Principal = {
#         Service = "ec2.amazonaws.com"
#       },
#       Action = "sts:AssumeRole"
#     }]
#   })
# }
# resource "aws_iam_role_policy_attachment" "ecs_instance_role_policy" {
#   role       = aws_iam_role.ecs_instance_role.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
# }
# resource "aws_iam_instance_profile" "ecs_instance_profile" {
#   name = "ecsInstanceProfile"
#   role = aws_iam_role.ecs_instance_role.name
# }
