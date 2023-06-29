#!/bin/bash
sudo -i
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo “<html><h1> Welcome to our channel. Happy Learning from $(hostname -f)…</p> </h1></html>” >> /var/www/html/index.
systemctl restart httpd