resource "aws_launch_template" "main" { 

  image_id = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  network_interfaces {
    subnet_id                   = aws_subnet.priv[0].id
    associate_public_ip_address = var.associate_public_ip_address
    security_groups = [aws_security_group.template.id]
  }
  user_data = var.user_data != "" ? base64encode(var.user_data) : null
}