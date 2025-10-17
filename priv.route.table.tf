resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "Private-route"
    Environment = var.env
  }
}

resource "aws_route_table_association" "priv1" {
  count          = length(var.priv-subnet)
  subnet_id      = aws_subnet.priv[count.index].id
  route_table_id = aws_route_table.private.id
}