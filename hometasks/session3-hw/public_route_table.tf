resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-route"
  }
}

resource "aws_route_table_association" "pub-1" {
  subnet_id      = aws_subnet.pub-a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "pub2" {
  subnet_id      = aws_subnet.pub-b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "pub3" {
  subnet_id      = aws_subnet.pub-c.id
  route_table_id = aws_route_table.public.id
}


