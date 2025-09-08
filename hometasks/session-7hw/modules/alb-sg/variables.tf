variable "alb_sg_name" {
    type = string
}
variable "env" {
    type = string 
}
variable "description" {
    type = string
}
variable "cidr_ipv4" {
    type = string
}
variable "ports" {
    type = list(number)
}
variable "ip_protocol" {
    type = string
}

variable "egress_ip_protocol" {
    type = string
}
