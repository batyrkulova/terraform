resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-route"
    Environment = var.env
  }
}

resource "aws_route_table_association" "pub" {
  count          = length(var.pub-subnet)
  subnet_id      = aws_subnet.pub[count.index].id
  route_table_id = aws_route_table.public.id
}