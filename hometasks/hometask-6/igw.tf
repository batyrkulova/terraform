resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "task5"
        Environment = var.env
}
}
resource "aws_eip" "nat" {
  domain = "vpc"
} 
