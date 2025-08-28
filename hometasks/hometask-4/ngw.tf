resource "aws_nat_gateway" "ngw" {
    connectivity_type = "private"
    subnet_id         = aws_subnet.pub[1].id

    tags = {
        Name = "task4"
    }
    
}