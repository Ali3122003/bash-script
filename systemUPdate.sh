#!/bin/bash


#The Program Is Responsible For Updating The System Automatically 

if [[ $EUID -ne 0 ]]
then
	Red='\033[0;31m'
	echo -e  "This Script must be run as ${Red}root "	
	
elif [[ $EUID -eq 0 ]]
then 


	# Date  & Time Starting
	echo -e "\n$(date "+%d-%m-%Y --- %T")  --- Starting Work\n"

	#Debian
	system_Debian=$(cat /etc/os-release | grep -o "debian")

	#Arch
	system_Arch=$(cat /etc/os-release | grep -o m1 "arch")

	if [[ $system_Debian == "debian" ]]
	then
		apt update
		apt -y upgrade

		apt autoremove
		apt autoclean

	elif [[ $system_Arch == "arch" ]]
	then
        	pacman -Syu
		pacman -Qdtq

	else

	echo "I do not know this system $system_Debian , $system_Arch"

	fi 

	# Date  & Time Ending
	echo -e "\n$(date "+%d-%m-%Y --- %T")  --- Script Terminated\n"

else
	exit 1
	
fi

