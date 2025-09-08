resource "aws_autoscaling_group" "main" {
  name                      = var.asg_name
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  vpc_zone_identifier       = [for s in aws_subnet.priv : s.id]

  launch_template {
    id = aws_launch_template.main.id
    version = var.version
  }   
   tag {
    key                 = var.key
    value               = var.value
    propagate_at_launch = var.propagate_at_launch
  }


}

resource "aws_autoscaling_attachment" "main" {
  autoscaling_group_name = aws_autoscaling_group.main.id
  lb_target_group_arn    = aws_lb_target_group.main.arn
}