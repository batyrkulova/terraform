resource "aws_security_group" "template" {
  name        = "template-sg"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "template.sg"
    Environment = var.env
  }
}

resource "aws_vpc_security_group_ingress_rule" "in" {
  security_group_id = aws_security_group.template.id
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  referenced_security_group_id = aws_security_group.alb.id 
}

resource "aws_vpc_security_group_egress_rule" "out" {
  security_group_id = aws_security_group.template.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
  
}










