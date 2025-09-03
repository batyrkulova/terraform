resource "aws_eip" "nat_eip" {
      domain = "vpc"
      tags = {
        Name = "nat-gateway-eip"
      }
    }
resource "aws_nat_gateway" "ngw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id         = aws_subnet.pub[1].id

    tags = {
        Name = "task5"
        Environment = var.env
    }
}