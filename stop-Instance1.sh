#!/bin/bash
dialog --title "WARNING" \
--backtitle "WARNING" \
--yesno "WARNING: Are you sure you want to stop Instance1?" 7 60
response=$?
case $response in
   0)
     aws ec2 stop-instances --instance-ids i-08280bb7eb97da3c3
     aws ec2 describe-instances --instance-ids i-08280bb7eb97da3c3 --query 'Reservations[].Instances[].[Tags[?Key==`Name`]| [0].Value,State.Name]'
     echo -e "\e[0;31m Instance1 has been stopped \e[0m";;
   1)
     echo -e "\e[0;32m Instance1 was not stopped \e[0m";;
   255)
     echo "[ESC] key pressed.";;
esac
