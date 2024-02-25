#!/bin/bash

sudo apt-get update
sudo apt-get -y install borgbackup sshpass

ssh-keygen -q -f ~/.ssh/id_rsa -N ""
sshpass -p "qweQWE123" ssh-copy-id -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no borg@192.168.56.11
sudo cp -r .ssh /root/