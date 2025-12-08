#!/usr/bin/bash

read -p "type dir:" dir
read -p "Choose option log files(1), Py files(2): " option

case $option in

	1)
	for file in $(find "$dir"/*.log -type f 2>/dev/null); do
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
	for file in $(find "$dir"/*.py -type f 2>/dev/null); do
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
