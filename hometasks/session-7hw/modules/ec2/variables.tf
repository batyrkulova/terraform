variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}
variable "env" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "instance_name" {
  type = string
}

variable "user_data" {
  description = "User data script to execute on the EC2 instance"
  type        = string
}
