variable "asg_name" {
    type = string
}

variable "max_size" {
    type = number
}
variable "min_size" {
    type = number
}

variable "health_check_grace_period" {
    type = number
}

variable "health_check_type" {
    type = string 
}
variable "desired_capacity" {
    type = number
}

variable "version" {
    type = string
}

variable "key" {
    type = string
}
variable "value" {
    type = string
}

variable "propagate_at_launch" {
    type = bool
}