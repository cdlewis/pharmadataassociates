# Pharma Data Associates Website

[ ![Codeship Status for albertyw/pharmadataassociates](https://codeship.com/projects/7e5b4e40-3428-0134-823e-26e7891ba113/status?branch=master)](https://codeship.com/projects/164911)
[![Dependency Status](https://gemnasium.com/badges/github.com/albertyw/pharmadataassociates.svg)](https://gemnasium.com/github.com/albertyw/pharmadataassociates)
[![Code Climate](https://codeclimate.com/github/albertyw/pharmadataassociates/badges/gpa.svg)](https://codeclimate.com/github/albertyw/pharmadataassociates)
[![Test Coverage](https://codeclimate.com/github/albertyw/pharmadataassociates/badges/coverage.svg)](https://codeclimate.com/github/albertyw/pharmadataassociates/coverage)

https://www.pharmadataassociates.com/

PDA Website V2

Development
-----------

### Setup (using [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/)):

```bash
mkvirtualenv pharmadataassociates -p python3.5
pip install -r requirements.txt
pip install -r requirements-test.txt
ln -s .env.development .env
```

### Spinning up the server:

```bash
python app/serve.py
```

### Running tests:

```bash
cd app
coverage run -m unittest discover
```

Production
----------

### Setup

```bash
mkvirtualenv pharmadataassociates -p python3.5
pip install -r requirements.txt
ln -s .env.production .env
bin/setup.sh
```

### Deploment

```bash
bin/deploy.sh
```
