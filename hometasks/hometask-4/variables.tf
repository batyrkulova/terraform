variable "pub-subnet" {
    description = "Name of  of pub subnet"
    type = list(string)
    default = [ "pub1a", "pub2b", "pub3c" ]
}


variable "priv-subnet" {
    description = "Name of  of priv subnet"
    type = list(string)
    default = [ "priv1a", "priv2b", "priv3c" ]
}

variable "az" {
    description = "Az where the subnet is created "
    type = list(string)
    default = [ "us-west-2a", "us-west-2b", "us-west-2c" ]
}