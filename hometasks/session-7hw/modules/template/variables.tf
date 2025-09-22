variable "instance_type" {
    type = string
  
}

variable "associate_public_ip_address" {
    type = bool
}

variable "user_data" {
  type        = string
  default     = ""
}
