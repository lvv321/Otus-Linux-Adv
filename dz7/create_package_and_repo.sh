sudo apt-get -y install curl gnupg2 ca-certificates lsb-release ubuntu-keyring dpkg-dev
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
echo "deb-src [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" | sudo tee /etc/apt/preferences.d/99nginx
sudo apt-get update

sudo apt-get -y build-dep nginx

mkdir ~/nginx
mkdir ~/myrepo

cd ~/nginx
apt-get source nginx
cd $(ls -d */)

# Set custom name for package
sed -i '1 s/)/-mycustom)/' debian/changelog

sudo dpkg-buildpackage -b
cp ../*-mycustom_amd64.deb ~/myrepo/

cd ~/myrepo/
dpkg-scanpackages . /dev/null > Packages
apt-ftparchive release . > Release

sudo dpkg -i nginx_1.24.0-1~jammy-mycustom_amd64.deb
sudo systemctl start nginx

sudo mkdir -p /usr/share/nginx/html/myrepo/
sudo cp * /usr/share/nginx/html/myrepo/