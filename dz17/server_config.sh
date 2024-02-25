#!/bin/bash

sudo vgcreate mygroup /dev/sdb
sudo lvcreate -l +100%VG -n myvolume mygroup
sudo  mkfs.ext4 /dev/mygroup/myvolume
sudo mkdir /var/backup
sudo mount /dev/mygroup/myvolume /var/backup/
echo "/dev/mygroup/myvolume /var/backup/ ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo apt-get update
sudo apt-get -y install borgbackup
sudo useradd -m borg
echo "borg:qweQWE123" | sudo chpasswd

sudo -i -u borg
mkdir .ssh
touch .ssh/authorized_keys
chmod 700 .ssh
chmod 600 .ssh/authorized_keys