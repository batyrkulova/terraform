resource "aws_launch_template" "main" { 

  image_id = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"
  network_interfaces {
    subnet_id                   = aws_subnet.priv[0].id
    associate_public_ip_address = false
    security_groups = [aws_security_group.template.id]
  }
  user_data = filebase64("user_data.sh")
}

