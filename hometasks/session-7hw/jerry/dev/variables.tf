variable "lb_name" {
    default = "module_alb"
}
variable "internal" {
    default = "false"
}

variable "load_balancer_type " {
    default = "application"
}

variable "env" {
  description = "This is a variable for environment"
  type = string
  default = "dev"
}

variable "cloud_region" {
  description = "Cloud Provider region"
  type = string
  default = "usw2"
}

variable "tier" {
  description = "Application tier"
  type = string
  default = "backend"
  
}

variable "business_unit" {
  description = "This is a varaible for Business Unit"
  type = string
  default = "orders"
}

variable "cloud_provider" {
  description = "Cloud Provider"
  type = string
  default = "aws"
}

variable "project" {
    description = "This is a variable for the project"
    type = string
    default = "jerry"
}

variable "team" {
    description = "This is a variable for team name"
    type = string
    default = "DevOps"
}
variable "managed_by" {
    description = "The tool that manages the resource"
    type = string
    default = "Terraform"
}
variable "owner" {
    description = "Project Owner"
    type = string
    default = "elsu@akumosolutions.io"  
}

variable "alb_sg_name" {
    default = "Allow_tls"
}

variable "description" {
    default = "Allow tls inbound and  all outbound traffic"
}
variable "cidr_ipv4" {
    default = "0.0.0.0/0"
}
variable "ports" {
    default = [ 80, 443 ]
}
variable "ip_protocol" {
    default = "tcp"
}

variable "egress_ip_protocol" {
    default = "-1"
}

variable "target_group_name" {
    default = "Module_tg"
}

variable "port" {
    type = 80
}

variable "protocol" {
    type = "HTTP"
}

variable "default_type" {
    type = "forward"
}

variable "asg_name" {
    default = "Module_asg"
}

variable "max_size" {
    default = 2
}
variable "min_size" {
    default = 1
}

variable "health_check_grace_period" {
    default = 300
}

variable "health_check_type" {
    default = "ELB" 
}
variable "desired_capacity" {
    default = 1
}

variable "version" {
    default = "$Latest"
}
variable "propagate_at_launch" {
    default = true
}

variable "instance_type" {
    default = "t3.micro"
  
}

variable "associate_public_ip_address" {
    default = false
}


variable "template_sg_name" {
    default = "Module_template_sg"
}
variable "description" {
    type = "tcp"
}

variable "port" {
    default = [80]
}
