#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
cd /tmp
yum install git -y 
git clone https://github.com/batyrkulova/python.scripts.git
sudo cp /tmp/python.scripts/index.html /var/www/html/
sudo cp /tmp/python.scripts/script.js /var/www/html/
sudo cp /tmp/python.scripts/style.css /var/www/html/
echo ECS_CLUSTER=${aws_ecs_cluster.main.name} >> /etc/ecs/ecs.config


