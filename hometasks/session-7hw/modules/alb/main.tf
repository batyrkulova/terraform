resource  "aws_lb" "main" {
    name = var.lb_name
    internal = var.internal
    load_balancer_type = var.load_balancer_type
    security_groups = [aws_security_group.alb.id]
    subnets = [for s in aws_subnet.pub : s.id]
    tags = {
        Environment = var.env
    }
} 