resource "aws_s3_bucket" "example" {
  for_each = var.buckets
  bucket =  each.value.name

  tags = {
    Name        = each.key
    Enviremant  = each.value.env
  }
  lifecycle {
    create_before_destroy = false
  }
}


variable "buckets" {
    description = "Name of  of the buckets"
    type = map(any)
    default = {
        bucket-1 = {name = "terraform-session-apr2025-elsu-1", env = "dev"}
        bucket-2 = {name = "terraform-session-apr2025-elsu-1", env = "dev"}
    }
}
