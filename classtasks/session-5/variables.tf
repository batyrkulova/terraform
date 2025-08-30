variable "env" {
    description = "This is the variable for the environment"
    type = string 
    default = "dev"
}

variable "aws_region" {
    description = "Cloud provider region"
    type = string
    default = "usw2"
}

variable "tier" {
    description = "App tier"
    type = string
    default = "backend"
}

variable "cloud_provider" {
    description = "Cloud provider"
    type = string
    default = "aws"
}

variable "project" {
    description = "Project name"
    type = string
    default = "jerry"
}

variable "managed_by" {
    description = "The tool"
    type = string 
    default = "terraform"
}

variable "owner" {
    description = "The owner"
    type = string
    default = "example_com"
}