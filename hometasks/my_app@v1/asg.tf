# resource "aws_autoscaling_group" "main" {
#   name                      = "task5-asg"
#   max_size                  = 3
#   min_size                  = 1
#   health_check_grace_period = 300
#   health_check_type         = "ELB"
#   desired_capacity          = 2
#   vpc_zone_identifier       = [for s in aws_subnet.priv : s.id]

#   launch_template {
#     id = aws_launch_template.main.id
#     version = "$Latest"
#   }   
#    tag {
#     key                 = "Environment"
#     value               = var.env
#     propagate_at_launch = true
#   }


# }

# resource "aws_autoscaling_attachment" "main" {
#   autoscaling_group_name = aws_autoscaling_group.main.id
#   lb_target_group_arn    = aws_lb_target_group.main.arn
# }
