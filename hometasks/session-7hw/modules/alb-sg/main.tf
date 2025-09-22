resource "aws_security_group" "alb" {
  name        = var.alb_sg_name.tf
  description = var.description
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = var.alb_sg_name
    Environment = var.env
  }
}

resource "aws_vpc_security_group_ingress_rule" "port-https" {
  for_each = toset(var.ports)
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = each.value
  ip_protocol       = var.ip_protocol
  to_port           = each.value
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.egress_ip_protocol
}