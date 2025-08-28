variable "env" {
    description = "This is an environment"
    type = string
    default = "dev"
}

variable "port" {
    description = "This is list of ports"
    type = list(number)
    default = [22, 25, 80, 3306, 3456 ]
}

variable "cidr_blocks" {
    description = "This is a list of Cidre blocks"
    type = list(string)
    default = ["10.0.0.0/24", "10.0.1.0", "10.0.2.0" ]
}