resource "aws_instance" "main" {
  ami                     = data.aws_ami.amazon_linux_2023.id
  instance_type           = var.instance_type
  key_name                = var.key_name
  subnet_id               = aws_subnet.priv-a.id
  associate_public_ip_address = false
  vpc_security_group_ids = [ aws_security_group.instance_sg.id ]
  user_data = file("user_data.sh")
  
  tags = {
    Name = "my_instance"
    Enviroment = "Development"
  }
}