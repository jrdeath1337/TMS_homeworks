#!/usr/bin/bash

read -p "Type directiry: " dir
read -p "Type line: " line

for file in $(find "$dir" -type f)
do
	 filter=$(grep -rlsIi "$line" "$file" 2>/dev/null)
	 text=$(grep -swIi --color=always "$line" "$filter")
	 if [[ -n "$text" ]]; then
    	 printf "%s\n%s\n%s\n\n" "$filter" "text in file: " "$text"
         fi
done
