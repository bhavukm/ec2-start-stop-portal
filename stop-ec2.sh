#!/bin/bash

# while-menu: a menu-driven system information program
#export PS1=" \[\033[34m\]\u@\h \[\033[33m\]\w\[\033[31m\]\[\033[00m\] $ "
#echo -e '\033[0;31mred\033[0;32mgreen\033[0;34mblue\033[0mnormal'
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
  echo -e "${BOLDCYAN}Stop Instances:${ENDCOLOR}"
echo -e "${BOLDGREEN}1. Instance1${ENDCOLOR}"
echo -e "${BOLDGREEN}2. Instance2${ENDCOLOR}"
echo -e "${BOLDGREEN}3. Go Back to Main Menu${ENDCOLOR}"
#1. Start test-ec2-1
#2. Stop test-ec2-1
#3. Check current status of test-ec2-1

#_EOF_

  read -p "Enter selection [1-3] > "

  if ((REPLY >= 1 && REPLY <= 3)); then

    case $REPLY in
      1)
        ./stop-Instance1.sh
        read -p "Press enter to continue"
        continue
        ;;
      2)
        ./stop-Instance2.sh
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
