#!/bin/bash

sudo sed -i 's/^PasswordAuthentication.*$/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd.service

sudo useradd admuser && sudo useradd reguser
echo "admuser:qweQWE123" | sudo chpasswd && echo "reguser:qweQWE123" | sudo chpasswd

sudo groupadd admin
for user in {admuser,vagrant,root}; do sudo usermod -aG admin "$user"; done

sudo mv /tmp/login.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/login.sh

echo "auth required pam_exec.so /usr/local/bin/login.sh" | sudo tee -a /etc/pam.d/sshd

sudo date 021701002024.00