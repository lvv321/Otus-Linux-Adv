#!/bin/sh -eux

echo "adding insecure SSH key for vagrant user"
echo $'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key\nssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN1YdxBpNlzxDqfJyw/QKow1F+wvG9hXGoqiysfJOn5Y vagrant insecure public key' > /home/vagrant/.ssh/authorized_keys

echo "enabling password-less sudo for vagrant user"
echo "vagrant ALL=(ALL) NOPASSWD: ALL" | EDITOR="tee -a" visudo

echo "install dependencies for virtualbox additions 7.0"
apt -y install bzip2

echo "install/update virtualbox additions"
mkdir /tmp/isomount
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /tmp/isomount
sh /tmp/isomount/VBoxLinuxAdditions.run
umount /tmp/isomount
rmdir /tmp/isomount
rm /home/vagrant/VBoxGuestAdditions.iso