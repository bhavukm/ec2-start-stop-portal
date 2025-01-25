#!/bin/bash

# while-menu: a menu-driven system information program
#export PS1=" \[\033[34m\]\u@\h \[\033[33m\]\w\[\033[31m\]\[\033[00m\] $ "
#echo -e '\033[0;31mred\033[0;32mgreen\033[0;34mblue\033[0mnormal'
trap ' ' SIGTSTP SIGINT SIGTERM
DELAY=10 # Number of seconds to display results
RED="31"
GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"
ENDCOLOR="\e[0m"

while true; do
  clear
#  cat << _EOF_
echo -e "${BOLDGREEN}Please Select:${ENDCOLOR}"
#Please Select:
echo -e "${BOLDGREEN}1. Start Instances${ENDCOLOR}"
echo -e "${BOLDGREEN}2. Stop Instances${ENDCOLOR}"
echo -e "${BOLDGREEN}3. Check Status Of Instances${ENDCOLOR}"
echo -e "${BOLDGREEN}4. Logout${ENDCOLOR}"
#1. Start test-ec2-1
#2. Stop test-ec2-1
#3. Check current status of test-ec2-1

#_EOF_

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
       # sleep $DELAY
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
 #   echo "Invalid entry."
    read -p "Press enter to continue"
   # sleep $DELAY
  fi
done
echo "Program terminated."
