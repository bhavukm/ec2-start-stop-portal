#!/bin/bash
dialog --title "WARNING" \
--backtitle "WARNING" \
--yesno "WARNING: Are you sure you want to stop Instance2?" 7 60
response=$?
case $response in
   0)
     aws ec2 stop-instances --instance-ids i-088cf1b557396cbb8
     aws ec2 describe-instances --instance-ids i-088cf1b557396cbb8 --query 'Reservations[].Instances[].[Tags[?Key==`Name`]| [0].Value,State.Name]'
     echo -e "\e[0;31m Instance2 has been stopped \e[0m";;
   1)
     echo -e "\e[0;32m Instance2 was not stopped \e[0m";;
   255)
     echo "[ESC] key pressed.";;
esac
