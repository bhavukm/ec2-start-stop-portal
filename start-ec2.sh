#!/bin/bash

DELAY=10 # Number of seconds to display results
RED="31"
GREEN="32"
BLUE="34"
CYAN="36"
BOLDCYAN="\e[1;${CYAN}m"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"
ENDCOLOR="\e[0m"

while true; do
  clear
  echo -e "${BOLDCYAN}Start Instances:${ENDCOLOR}"
echo -e "${BOLDGREEN}1. Instance1${ENDCOLOR}"
echo -e "${BOLDGREEN}2. Instance2${ENDCOLOR}"
echo -e "${BOLDGREEN}3. Go Back to Main Menu${ENDCOLOR}"

  read -p "Enter selection [1-3] > "

  if ((REPLY >= 1 && REPLY <= 3)); then

    case $REPLY in
      1)
        aws ec2 start-instances --instance-ids i-Instance-ID1
	aws ec2 describe-instances --instance-ids i-Instance-ID1 --query 'Reservations[].Instances[].[Tags[?Key==`Name`]| [0].Value,State.Name]'
        echo -e "\e[33mWARNING: Please wait for at least 3 minutes before connecting to the instance\e[0m"
        read -p "Press enter to continue"
        continue
        ;;
      2)
       aws ec2 start-instances --instance-ids i-Instance-ID2
       aws ec2 describe-instances --instance-ids i-Instance-ID2 --query 'Reservations[].Instances[].[Tags[?Key==`Name`]| [0].Value,State.Name]'
       echo -e "\e[33mWARNING: Please wait for at least 3 minutes before connecting to the instance\e[0m"
       read -p "Press enter to continue"
       continue
        ;;
        3)	
       ./start-stop-ec2-script.sh
       read -p "Press enter to continue"
        continue
       ;;
    esac
  else
          echo -e "\e[32mInvalid Entry\e[0m"
    read -p "Press enter to continue"
  fi
done
echo "Program terminated."
