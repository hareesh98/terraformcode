#!/bin/sh

sudo bash
yum update -y
yum install -y httpd
echo "Welcome to Terraform tutorials" > /var/www/html/index.html
systemctl daemon-reload
systemctl restart httpd
