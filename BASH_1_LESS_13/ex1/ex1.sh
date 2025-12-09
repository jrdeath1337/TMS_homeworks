#!/usr/bin/bash

read -p "Choose directory: " dir

for file in $(find "$dir" -type f 2>/dev/null); do
	if [[ -f "$file" && "$file" == "*.log" ]]; then

        	timestamp=$(stat -c %Y "$file")
        	formatted_timestamp=$(date -d "@$timestamp" +"%Y%m%d_%H%M%S")

       		name="${file%.*}"
     		ext="${file##*.}"

   	 	new_name="${name}_${formatted_timestamp}.${ext}"

  	 	#mv "$file" "$new_name"
   		echo "Переименован: $file -> $new_name"
		echo "$new_file"
	elif [[ -f "$file" && "*.py" ]]; then
		githash=$(git log -1 --format="%h")

        	name="${file%.*}"
    	   	ext="${file##*.}"

   	 	new_name="${name}.${ext}_$githash"

   	 	#mv "$file" "$new_name"
  	 	echo "Переименован: $file -> $new_name"
		echo "$new_file"
	else
		echo "Files not found in this directory"
	fi
done

