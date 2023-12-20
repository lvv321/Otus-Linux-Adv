echo "deb http://localhost/myrepo ./" | sudo tee /etc/apt/sources.list.d/myrepo.list
sudo apt-get update --allow-insecure-repositories
sudo apt-get install nginx