resource  "aws_lb" "main" {
    name = "task5"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.alb.id]
    subnets = [for s in aws_subnet.pub : s.id]
    tags = {
        Environment = var.env
    }
} 
