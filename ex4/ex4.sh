#!/usr/bin/bash
echo "HELLO USER"
read -p "type file name: " filename 					#First arg
read -p "type file extension without dot: " ext 			#Second arg
read -p "print the path to the directory: " dir 			#Third arg

if [[ -d "$dir" ]]; then #Check existense directory
	if ls "$dir" | grep -q -r -l "\.$ext$"; then 			# Check are there any files with this extension 
		touch "$PWD/$filename" 					# Create new file 
		ls "$dir" | grep -r -l "\.$ext$" > "$PWD/$filename" 	# Outout redirection
		echo "You file in $PWD/$filename"			# Show way to the file
	else	
		echo "No file with this extension"			# Error
	fi
else
	echo "Directory does not exist"					# Error
fi
