variable "name" {
  type = string
}
variable "description" {
  type = string 
}

variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks allowed to access ports 80 and 443"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Tags to apply to the security group"
  type        = map(string)
  default     = {}
}
