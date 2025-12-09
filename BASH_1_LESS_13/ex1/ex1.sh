#!/usr/bin/bash

read -p "Choose directory: " dir

for file in $(find "$dir" -type f 2>/dev/null); do	#Запускаем все файлы в директории в цикл
	if [[ "$file" == *.log ]]; then			#Проверяем что файл имеет расширение .log

        	timestamp=$(stat -c %Y "$file")		#Узнаем время изменения файла
        	formatted_timestamp=$(date -d "@$timestamp" +"%Y%m%d_%H%M%S")	#Переводим секунды в человеческий формат

       		name="${file%.*}"	#Отделяем имя
     		ext="${file##*.}"	#Отделяем расширение

   	 	new_name="${name}_${formatted_timestamp}.${ext}"	#Формируем имя нового файла

  	 	mv "$file" "$new_name"		#Муваем файл для переименования
   		echo "NEW FILE"
		printf "%s\n %s" "$file" "--->" "$new_name"
	elif [[ "$file" == *.py ]]; then
		githash=$(git log -1 --format="%h")	#Получаем последний хеш коммита

        	name="${file%.*}"
    	   	ext="${file##*.}"

   	 	new_name="${name}_$githash.${ext}"

   	 	mv "$file" "$new_name"
		echo "NEW FILE"
		printf "%s\n %s" "$file" "--->" "$new_name"
	else
		echo "ERROR"	#Выводит ошибку при отсутствии файлов нужного расширения
		echo "$file not LOG or PY"
	fi
done

