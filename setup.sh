#! /bin/bash
set -xe

# Setup
apt install -y nginx python3-pip python3.10-venv
/usr/bin/python3 -m venv /.app/.venv
source /.app/.venv/bin/activate
cp -f /.app/tech-interview-quest/K01ServerStop.sh /etc/rc0.d/K01ServerStop.sh
pip3 install -r requirements.txt

# Rollback to the beginning
systemctl stop interview-backend.service
rm -fv /etc/nginx/sites-available/flask_app
rm -fv /etc/nginx/sites-enabled/flask_app
cp -r app/html/* /var/www/html/
cp flask_app /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/flask_app /etc/nginx/sites-enabled/
rm -fv /etc/nginx/sites-enabled/default
rm -rf /home/hero/*
cp strange_box.tar.gz /home/hero/strange_box.tar.gz
cp -f interview-backend.service /etc/systemd/system/interview-backend.service
chmod 644 /etc/systemd/system/interview-backend.service
rm /home/hero/.bash_history
rm /home/superhero/.bash_history

# Start of quest
nohup bash /.app/tech-interview-quest/broken_backend.sh >/dev/null 2>&1 &
systemctl daemon-reload
systemctl start interview-backend.service
systemctl restart nginx

