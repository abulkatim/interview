#!/bin/bash

source /.app/creds.txt

IP=$(curl -s https://2ip.ru)

TELEGRAM_LINK="https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage"

curl -s -X POST $TELEGRAM_LINK -d chat_id=$TELEGRAM_CHATID -d text="Current IP: $IP"
