variable "cidr_block" {
    description = "Number of IP's for the VPC"
    type = string
    default =  "10.0.0.0/16"
}

variable "key_name" {
    description = "ssh key name for ec2 instance"
    type = string
    default = "MyMac Key"
}


variable "instance_type" { 
  description = "aws ec2 instance type or size"
  type = string 
  default = "t3.micro" 
}