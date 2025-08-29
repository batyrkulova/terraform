resource "aws_subnet" "pub" {
    count = length(var.pub-subnet)
    availability_zone = var.az[count.index]
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet("10.0.0.0/16", 8, count.index)

     tags = {
        Name = var.pub-subnet[count.index]
        Environment = var.env
  }
}



resource "aws_subnet" "priv" {
    count = length(var.priv-subnet)
    availability_zone = var.az[count.index]
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet("10.0.0.0/16", 8, count.index +10)

    tags = {
        Name = var.priv-subnet[count.index]
        Environment = var.env
    }
}