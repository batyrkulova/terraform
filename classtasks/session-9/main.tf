resource "aws_sqs_queue" "test" {
    name = "${var.env}-quenue"

} 

 resource "aws_instance" "main" {
    ami = "ami-01102c5e8ab69fb75"
    instance_type = "t3.micro"
    key_name = "MyMac Key"
    tags = {
        Name = "tarraform-session-instance"
        Environment = "devops"
    }
}

variable "env" {
  description = "env"
  type = string
  default = "dev"
}