variable "vpc_cidr_block" {
    type = string
}
variable "instance_tenancy" {
    type = string
}

variable "name_vpc" {
    type = string
}

variable "env" {
    type = string
}

variable "pub-sub" {
    description = "Name of  of pub subnet"
    type = list(string)
}


variable "priv-sub" {
    description = "Name of  of priv subnet"
    type = list(string)
}

variable "az" {
    description = "Az where the subnet is created "
    type = list(string)
}

variable "env" {
    description = " Name of the Environment"
    type = string
}

variable "route_cidr_block" {
    description = "Cidr block for public and private route table "
    type = string 
}

variable "pub_route_table_name" {
    type = string
}

variable "priv_route_table_name" {
    type = string
}

variable "igw_name" {
    type = string
}
variable "eip_domain" {
    type = string
}
variable "ngw_name" {
    type = string
}