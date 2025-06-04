#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
RESET='\033[0m'

printf "\t\t${CYAN}%sUpdating Clamscan Database%s${RESET}\n\n" "---" "---"


printf "\t${YELLOW}Stopping${RESET} clamav-freshclam.service...\n"
systemctl stop clamav-freshclam.service &>> /var/log/clamav.log
if [ $? -eq 0 ]; then
	printf "\t\t${GREEN}clamav-freshclam.service${RESET} Stopped\n"
else
	printf "\t\t${RED}clamav-freshclam.service${RESET} Failed to Stop...\n\t\tExiting Now!"
	exit 1
fi

printf "\t${YELLOW}Updating${RESET} clamav Database\n"
freshclam &>> /var/log/clamav.log
if [ $? -eq 0 ]; then
	printf "\t\t${GREEN}clamav Database Successfully Updated!${RESET}\n"
else 
	printf "\t\tclamav Database ${RED}Failed to Update${RESET}...\n\t\tExiting Now!"
	exit 1
fi

systemctl start clamav-freshclam.service &>> /var/log/clamav.log
printf "\t${YELLOW}Starting${RESET} clamav-freshclam.service...\n"
if [ $? -eq 0 ]; then
	printf "\t\t${GREEN}clamav-freshclam.service Started!${RESET}\n"
else
	printf "\t\tclamav-freshclam.service ${RED}Failed to Start${RESET}\n\t\tExiting Now!"
	exit 1

fi


