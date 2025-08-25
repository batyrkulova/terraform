resource "aws_instance" "main" {
    ami = "ami-01102c5e8ab69fb75"
    instance_type = "t2.micro"
    key_name = "MyMac Key"
    tags = {
       Name = "my-terraform-webserver"
       Environment = "devops"
    }
    user_data = file("script.sh")
}