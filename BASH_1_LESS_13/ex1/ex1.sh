#!/usr/bin/bash

read -p "Choose directory: " dir
read -p "Choose extension: " ext
read -p "Choose option timestamp(1), git hesh(2): " option

case $option in

	1)
	for file in $(find "$dir" -maxdepth 1 -name -type f ."$ext"  f 2>/dev/null); do
		if [ -f "$file" ]; then

        		timestamp=$(stat -c %Y "$file")
        		formatted_timestamp=$(date -d "@$timestamp" +"%Y%m%d_%H%M%S")

        		name="${file%.*}"
    	   		ext="${file##*.}"

   	 		new_name="${name}_${formatted_timestamp}.${ext}"

   	 		#mv "$file" "$new_name"
  	 		echo "Переименован: $file -> $new_name"
			echo "$new_file"
		fi
	done;;

	2)
	for file in $(find "$dir" -name \."$ext" -maxdepth -1 -type f 2>/dev/null); do
		if [ -f "$file" ]; then

        		githash=$(git log -1 --format="%h")

        		name="${file%.*}"
    	   		ext="${file##*.}"

   	 		new_name="${name}.${ext}_$githash"

   	 		#mv "$file" "$new_name"
  	 		echo "Переименован: $file -> $new_name"
			echo "$new_file"
		fi
	done;;
	*)
		echo "Error option"
esac
