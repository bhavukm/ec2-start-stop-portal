#!/bin/bash

trap ' ' SIGTSTP SIGINT SIGTERM
DELAY=10 # Number of seconds to display results
RED="31"
GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"
ENDCOLOR="\e[0m"

while true; do
  clear
echo -e "${BOLDGREEN}Please Select:${ENDCOLOR}"
#Please Select:
echo -e "${BOLDGREEN}1. Start Instances${ENDCOLOR}"
echo -e "${BOLDGREEN}2. Stop Instances${ENDCOLOR}"
echo -e "${BOLDGREEN}3. Check Status Of Instances${ENDCOLOR}"
echo -e "${BOLDGREEN}4. Logout${ENDCOLOR}"
read -p "Enter selection [1-4] > "

  if [[ $REPLY =~ ^[1-4]$ ]]; then
    case $REPLY in
      1)
        ./start-ec2.sh
        read -p "Press enter to continue"
        continue
        ;;
      2)
        ./stop-ec2.sh
       read -p "Press enter to continue"
        continue
        ;;
      3)
       ./status-ec2.sh
       read -p "Press enter to continue"
        continue
        ;;
      4)
	      pkill -SIGKILL -u portaluser && logout
       continue
       ;;
    esac
  else
          echo -e "\e[31mInvalid Entry\e[0m"
    read -p "Press enter to continue"
  fi
done
echo "Program terminated."
