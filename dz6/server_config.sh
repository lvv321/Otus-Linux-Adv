sudo apt update
sudo apt -y install nfs-kernel-server
sudo systemctl start nfs-kernel-server.service

sudo nfsconf --set nfsd udp on
sudo nfsconf --set nfsd vers4 off
sudo nfsconf --set mountd port 20048
sudo systemctl restart nfs-server.service

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow nfs
sudo ufw allow portmapper
sudo ufw allow from any to any port 20048
sudo ufw --force enable

sudo mkdir -p /srv/share/upload
sudo chown -R nobody:nogroup /srv/share
sudo chmod 777 /srv/share/upload
echo "/srv/share 192.168.56.12(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports
sudo exportfs -r