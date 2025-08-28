resource "aws_security_group" "main" {
  name        = "aws-sessiong-sg"
  description = "This is a sg for EC2 instance"
  
  tags = {
    Name = "aws-session-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "main" {
  count = length(var.port)
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = element(var.port, count.index)
  ip_protocol = "tcp"
  to_port     = element(var.port, count.index)
  tags = {
    Name = "${var.env}-rule-${var.cidr_blocks[count.index]}"
  }
}

resource "aws_vpc_security_group_egress_rule" "main" {
  security_group_id = aws_security_group.main.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}
  
