resource "aws_lb_target_group" "main" {
    name = "task5-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.main.id
    tags = {
        Environment = var.env
}
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}



