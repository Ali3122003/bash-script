#!/bin/bash


File=$@

#check

if [ -z $@ ]
then
        echo "Please Give Me a File !! "
        exit 1
fi


while read line;
do
	for i in $(echo "$line" | sed "s/,/ /g")

	do
		if [[ ${#i} -gt 6 && ${#i} -lt 12 &&
		      "$i" == *[A-Z]* && "$i" == *[a-z]* &&
		      "$i" == *[0-9]* && "$i" == *[@#$]*
		   ]]      	

		then 
			echo "$i"

		else 
			echo "FALSE"

		fi	
			

	done

done < "$File"


