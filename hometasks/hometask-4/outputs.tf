output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The id of vpc "
}
output "public_subnet_ids" {
  description = "The IDs of the public subnets."
  value       = [for s in aws_subnet.pub : s.id]
}

output "private_subnet_ids" {
  description = "The IDs of the public subnets."
  value       = [for s in aws_subnet.priv : s.id]
}