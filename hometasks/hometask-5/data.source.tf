data "aws_ami" "amazon_linux_2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.8.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


data "terraform_remote_state" "vpc_state" {
  backend = "s3"
  config = {
    bucket = "apr2025-terraform-session-backend-e"
    key    = "session3-hw/terraform.tfstate"
    region = "us-west-2" 
  }
}