#!/bin/bash

source=../creds.txt

IP=$(curl -s https://2ip.ru)

curl -s -X POST $TELEGRAM_LINK -d chat_id=$TELEGRAM_CHATID -d text="Current IP address: $IP"
