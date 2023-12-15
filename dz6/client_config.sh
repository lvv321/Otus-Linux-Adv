sudo apt update
sudo apt -y install nfs-common

sudo mkdir -p /nfs/share

# If NFS UDP Support enabled in kernel
# sudo mount 192.168.56.12:/srv/share /nfs/share -o vers=3,proto=udp

# If NFS UDP Support disabled in kernel (default Ubuntu config)
# sudo mount 192.168.56.21:/srv/share /nfs/share -o vers=3

echo "192.168.56.21:/srv/share /nfs/share nfs vers=3,x-systemd.automount,x-systemd.requires=network-online.target,x-systemd.device-timeout=10s 0 0" | sudo tee -a /etc/fstab
sudo mount -a