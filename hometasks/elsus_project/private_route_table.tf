resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "Private-route"
  }
}

resource "aws_route_table_association" "priv1" {
  subnet_id      = aws_subnet.priv-a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "priv2" {
  subnet_id      = aws_subnet.priv-b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "priv3" {
  subnet_id      = aws_subnet.priv-c.id
  route_table_id = aws_route_table.private.id
}