#!/bin/bash

# This script is meant to be run on a server with the production app running.
# It can be called from a CI/CD tool like Codeship.

set -ex

# Update repository
cd /var/www/pharmadataassociates/ || exit 1
git checkout master
git fetch -tp
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
sudo systemctl restart pharmadataassociates-uwsgi.service
