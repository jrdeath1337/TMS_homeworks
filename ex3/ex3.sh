#!/usr/bin/bash

read -p "type you arguments separated by spaces: " -a arg 	# Assigning a variable ("-a" - array arguments separeted by spaces)

echo "you type: "${arg[@]}"" 					# Print all arguments in terminal ("[@]"-all input arguments).
echo "printed arguments are in the "$PWD/arguments"" 		# Show way to the file with arguments.
touch "$PWD/arguments"					 	# Create new file for arguments
echo "${arg[@]}" >> "$PWD/arguments" 				# Output redirection
