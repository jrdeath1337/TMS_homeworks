#!/usr/bin/bash

read -p "Type directiry: " dir
read -p "Type line: " line

for file in $(find "$dir" -type f)
do
	 size=$(du -sh "$file")		#Create variable size
	 filter=$(grep -rlsIi "$line" "$file" 2>/dev/null)	#Тут я перейду на русский, grep -r-ищет рекурсивно все файлы,
#-l - выводит только имя файла, -s-подавляет выдачу ненужных строк (ошибки и тд), -I-для того чтобы файл с несколькими совпадениями
# выводился только один раз и наконец -i-для игнора регистра.
	 text=$(grep -sIi --color=always "$line" "$filter") #Тут мы ищем совпадения в выдаче grep сверху так как он выдает путь к
# файлу и снова делает grep, но сейчас мы убрали -l и нам выводит содержание с совпадениями (2 grep наверное избытачно, но я придумал)
# так.
	 if [[ -n "$text" ]]; then
    	 printf "%s %s\n%s\n%s\n\n" "$size" "$filter" "text in file: " "$text"
         fi
done
