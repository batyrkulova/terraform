output "vpc_id" {
    value = aws_vpc.main.id
}

output "internet_gateway_id" {
    value = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
    value = aws_nat_gateway.ngw.id
}

output "pub_subnet_id" {
    value = aws_subnet.pub[count.index].id
}
output "priv_subnet_id" {
    value = aws_subnet.priv[count.index].id
}

output "pub_route_table_id" {
    value = aws_route_table.pub.id
}

output "priv_route_table_id" {
    value = aws_route_table.priv.id
}
