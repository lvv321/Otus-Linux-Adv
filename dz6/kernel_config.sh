# Manual:
# https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel
# https://davidaugustat.com/linux/how-to-compile-linux-kernel-on-ubuntu
# https://itsfoss.com/compile-linux-kernel/

# Extend system volume before kernel compiling. Required free space aproximitely 30GB

# Enable deb-src in /etc/apt/sources.list
...
sudo apt update

# Required packages for compilation
sudo apt install build-essential libncurses-dev bison flex libssl-dev libelf-dev fakeroot dwarves

mkdir kernel
cd kernel

# Download kernel source
apt source linux-image-unsigned-$(uname -r) 

# CD to extracted kernel dir
# ...

# Copy the config file of currently installed Linux
cp -v /boot/config-$(uname -r) .config

# Configuring kernel
scripts/config --disable SYSTEM_TRUSTED_KEYS
scripts/config --disable SYSTEM_REVOCATION_KEYS
scripts/config --set-str CONFIG_SYSTEM_TRUSTED_KEYS ""
scripts/config --set-str CONFIG_SYSTEM_REVOCATION_KEYS ""

# Enabling UDP support for NFS
scripts/config --set-str CONFIG_NFS_DISABLE_UDP_SUPPORT n

# Creating custom version for kernel
./scripts/config --set-val LOCALVERSION "-myversion"

# Compiling...
fakeroot make -j$(nproc)

# Checking for errors
echo $?

# Installing modules and kernel
sudo make modules_install
sudo make install

sudo reboot now

# Checking kernel version
uname -rs