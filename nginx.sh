sudo apt update
sudo apt install nginx -y
sudo apt install certbot python3-certbot-nginx -y
sudo systemctl enable nginx
sudo systemctl restart nginx