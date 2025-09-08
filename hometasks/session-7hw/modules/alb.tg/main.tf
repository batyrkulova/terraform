resource "aws_lb_target_group" "main" {
    name = var.target_group_name
    port = var.port
    protocol = var.protocol
    vpc_id = aws_vpc.main.id
    tags = {
        Environment = var.env
}
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = var.default_type
    target_group_arn = aws_lb_target_group.main.arn
  }
}