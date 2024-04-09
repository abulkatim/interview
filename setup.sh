#! /bin/bash
set -xe

systemctl stop interview-backend.service
systemctl stop pretty_backend.service

apt install -y nginx python3-pip python3.10-venv
/usr/bin/python3 -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt

rm -fv /etc/nginx/sites-available/flask_app
rm -fv /etc/nginx/sites-enabled/flask_app

cp -r app/html/* /var/www/html/
cp flask_app /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/flask_app /etc/nginx/sites-enabled/
rm -fv /etc/nginx/sites-enabled/default
service nginx restart

cp -f interview-backend.service /etc/systemd/system/interview-backend.service

chmod 644 /etc/systemd/system/interview-backend.service

rm -rf /home/hero/*
cp strange_box.tar.gz /home/hero/strange_box.tar.gz

systemctl daemon-reload

bash ./broken_backend.sh
systemctl stop interview-backend.service

