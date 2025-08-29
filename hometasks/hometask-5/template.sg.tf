resource "aws_security_group" "template" {
  name        = "template-sg"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "template.sg"
    Environment = var.env
  }
}

resource "aws_security_group_rule" "allow_alb_http" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.template.id
  source_security_group_id = aws_security_group.alb.id
}
resource "aws_security_group_rule" "allow_egress" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.template.id
  source_security_group_id = aws_security_group.alb.id
}