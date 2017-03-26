#!/bin/bash

# Update repository
cd /var/www/website/ || exit 1
git checkout master
git pull

# Update python packages
source `which virtualenvwrapper.sh`
workon pharmadataassociates
pip install -r requirements.txt

# Make generated static file directory writable
sudo chown www-data app/static/gen
sudo chown www-data app/static/.webassets-cache

# Restart services
sudo service nginx restart
sudo systemctl restart uwsgi
