resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "task4"
    }
}

resource "aws_eip" "nat" {
  domain = "vpc"
}