#! /bin/bash
set -xe

#installing stuff
apt install -y nginx
apt install -y python3-pip
apt install -y python3.10-venv
/usr/bin/python3 -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt

#cleanup prev installations
rm -fv /etc/nginx/sites-available/flask_app
rm -fv /etc/nginx/sites-enabled/flask_app

#setting stuff up
cp -r app/html/* /var/www/html/
cp flask_app /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/flask_app /etc/nginx/sites-enabled/
rm -fv /etc/nginx/sites-enabled/default
systemctl restart nginx.service

#launching the broken backend...
python3 ./app/broken_backend.py &

#correct backend file is interview_backend.py
