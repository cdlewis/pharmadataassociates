#!/bin/bash

# Setup directories
sudo ln -s /var/www/website ~/website

# Clone repository
git clone git@github.com:albertyw/pharmadataassociates
sudo mv pharmadataassociates /var/www/website
cd /var/www/website || exit 1
ln -s .env.production .env

# Install nginx
sudo add-apt-repository ppa:nginx/stable
sudo apt-get update
sudo apt-get install -y nginx

# Configure nginx
sudo mv /etc/nginx/sites-available /etc/nginx/sites-available.bak
sudo mv /etc/nginx/sites-enabled /etc/nginx/sites-enabled.bak
sudo ln -s /var/www/website/config/sites-available /etc/nginx/sites-available
sudo ln -s /var/www/website/config/sites-enabled /etc/nginx/sites-enabled
sudo service nginx restart
sudo rm -r /var/www/html

# Secure nginx
openssl dhparam -out /etc/nginx/ssl/dhparams.pem 2048
# Copy server.crt and server.key to /etc/nginx/ssl
sudo service nginx restart

# Install uwsgi
sudo apt-get install -y uwsgi uwsgi-plugin-python3 python3-dev python3-setuptools

# Install python/pip/virtualenvwrapper
curl https://bootstrap.pypa.io/get-pip.py | sudo python3
sudo pip3 install virtualenvwrapper

# Install python packages
. /usr/local/bin/virtualenvwrapper.sh
mkvirtualenv --python=/usr/bin/python3 pharmadataassociates
pip3 install -r /var/www/website/requirements.txt
sudo ln -s $HOME/.virtualenvs /var/www/.virtualenvs

# Set up uwsgi
sudo ln -s /var/www/website/config/uwsgi/website.ini /etc/uwsgi/apps-available/website.ini
sudo ln -s ../apps-available/website.ini /etc/uwsgi/apps-enabled/website.ini
sudo service uwsgi restart
