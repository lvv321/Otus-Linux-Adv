sudo mdadm --create --verbose /dev/md0 -l 5 -n 5 /dev/sd{b,c,d,e,f}
sudo mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' | sudo tee -a /etc/mdadm/mdadm.conf
sudo update-initramfs -u

sudo parted -s /dev/md0 mklabel gpt
sudo parted /dev/md0 mkpart primary ext4 0% 15%
sudo parted /dev/md0 mkpart primary ext4 15% 20%
sudo parted /dev/md0 mkpart primary ext4 20% 30%
sudo parted /dev/md0 mkpart primary ext4 30% 31%
sudo parted /dev/md0 mkpart primary ext4 31% 100%
for i in $(seq 1 5); do sudo mkfs.ext4 /dev/md0p$i; done
sudo mkdir -p /raid/part{1,2,3,4,5}
for i in $(seq 1 5); do sudo mount /dev/md0p$i /raid/part$i; done
for i in $(seq 1 5); do echo "/dev/md0p$i /raid/part$i ext4 defaults 0 0" | sudo tee -a /etc/fstab; done