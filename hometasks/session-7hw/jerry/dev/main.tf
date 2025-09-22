module "alb" {
    source = "../modules/alb"
    name = var.lb_name
    internal = var.internal
    load_balancer_type = var.load_balancer_type
    security_groups = aws_security_group.alb.id 
    subnets = [for s in aws_subnet.pub : s.id]
    tags = local.common_tags
}

module "alb_sg" {
    source = "../modules/alb-sg"
    name = var.alb_sg_name 
    description = "Allow TLS inbound traffic and all outbound traffic"
    vpc_id = aws_vpc.main.id
    tags = local.common_tags
    security_group_id = aws_security_group.alb.id
    cidr_ipv4         = var.cidr_ipv4
    from_port         = each.value
    to_port           = each.value
    ip_protocol       = var.ip_protocol

}

module "alb.tg" {
    source = "../modules/alb"
    name = var.target_group_name
    port = var.port
    protocol = var.protocol
    vpc_id = aws_vpc.main.id
    tags = local.common_tags
}

module "alb.tg" {
    source = "../modules/alb"
    load_balancer_arn = aws_lb.main.arn
    port              = var.port
    protocol          = var.protocol
    type             = var.default_type
    target_group_arn = aws_lb_target_group.main.arn
}
    
module "asg" {
    source = "../modules/asg"
    name                      = var.asg_name
    max_size                  = var.max_size
    min_size                  = var.min_size
    health_check_grace_period = var.health_check_grace_period
    health_check_type         = var.health_check_type
    desired_capacity          = var.desired_capacity
    vpc_zone_identifier       = [for s in aws_subnet.priv : s.id]
    id = aws_launch_template.main.id
    version = var.version
    tags = local.common_tags
    autoscaling_group_name = aws_autoscaling_group.main.id
  lb_target_group_arn    = aws_lb_target_group.main.arn
}

module "template" {
    source = "../modules/template"
    image_id = data.aws_ami.amazon_linux_2023.id
    instance_type = var.instance_type 
    subnet_id                   = aws_subnet.priv[0].id
    associate_public_ip_address = var.associate_public_ip_address
    security_groups = [aws_security_group.template.id]
  user_data = filebase64("user_data.sh")    
}

module "template_sg" {
  source      = "../modules/template.sg"
  name        = var.template_sg_name
  description = var.description
  vpc_id      = aws_vpc.main.id
  tags        = local.common_tags
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port
  to_port           = var.port
  ip_protocol       = var.ip_protocol
}