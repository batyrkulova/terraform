#!/bin/bash

dnf update -y
dnf install -y httpd git
systemctl start httpd
systemctl enable httpd
echo "Hello there" > /var/www/html/

