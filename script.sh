#!/bin/bash

# Install Apache on Ubuntu
sudo apt -y update
# apache installation, enabling and status check
sudo apt install apache2 -y
sudo systemctl start 
sudo systemctl enable apache2
sudo systemctl status apache2 | grep Active
# firewall installation, start and status check
sudo apt install firewalld -y
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld | grep Active
# adding http services
sudo firewall-cmd --permanent --add-port=80/http
# reloading the firewall
sudo firewall-cmd --reload

sudo cat > /var/www/html/index.html << EOF
<html>
<head>
  <title> HelloWorld </title>
</head>
<body>
  <p> HelloAgain TEAM
</body>
</html>
EOF