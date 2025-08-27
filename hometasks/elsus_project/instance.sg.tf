resource "aws_security_group" "instance_sg" {
  name        = "allow_http"
  description = "Allow http inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "Ec2_security_group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_sg" {
  security_group_id = aws_security_group.instance_sg.id
  from_port         = 80
  cidr_ipv4         = aws_vpc.main.cidr_block
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_egress_rule" "allow" {
  security_group_id = aws_security_group.instance_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}