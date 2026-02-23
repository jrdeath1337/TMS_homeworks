#!/usr/bin/bash

#Мой англиский не очень))))

read -p "Type directory to searching all files: " dir  			#Choose directory
read -p "Full format (1) or short format (2): " format			#Choose output format

case $format in		#Use case for select output format
1)
	for file in $(find "$dir" -type f) 	#Find all files in this directory
	do 
		name="$(stat -c%n "$file")"	#Create name variable
		per="$(stat -c%A "$file")"	#Create permission variable
		size="$(stat -c%s "$file" | numfmt --to=iec-i)"	#Create size variable and translate in humans format
		printf "%s %-10s %s\n" "$size" "$per" "$name"	#Create full output information
	done ;;
2)
	printf "*---SIZE---*---PERM---*--------------------------------NAME----------------------------------------*\n"	#Table size
	for file in $(find "$dir" -type f)	
	do 
		name="$(stat -c%n "$file" 2>/dev/null)"
		per="$(stat -c%A "$file" 2>/dev/null)"
		size="$(stat -c%s "$file" 2>/dev/null | numfmt --to=iec-i)"
		if [[ -n "$name" && -n "$per" && -n "$size" ]]; then
		printf "| %-10.10s | %-10.10s | %-70.70s |\n" "$size" "$per" "$name" #Create short output format
		fi
	done ;;
esac
