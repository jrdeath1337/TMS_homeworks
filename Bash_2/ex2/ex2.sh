#!/bin/bash

read -rp "Введите путь к файлу: " file_path

if [ ! -f "$file_path" ]; then
    echo "Файл не найден!"
    exit 1
fi

awk '{
    
    if (NF == 0) { #Проверка пустых строк, NF - количество полей в строке
        print ""
        next #Переход к след строке
    }
    
    # Обрабатываем первое слово
    first_word = $1
    clean_first = tolower(first_word) #Создает слово в нижнем регистре
    sub(/\.$/, "", clean_first) #Удаляем точку с помощью регулярки
    
    result = first_word #Формируем результат
    prev_clean = clean_first #Запоминание для сравнения
    
    for (i = 2; i <= NF; i++) { #Перебор всех слов со 2 в строке
        current_word = $i
        clean_current = tolower(current_word) #Делает нижний регистр для сравнения 
        sub(/\.$/, "", clean_current) #Удаление точки по регулярке
        
        if (clean_current != prev_clean) { #Следующее слово не равно предыдущему 
            result = result " " current_word #Запись результата через пробел
            prev_clean = clean_current #Пропускаем если слова равны 
        }
        # Если слова совпадают - пропускаем
    }
    
    print result #Выводим результат
}' "$file_path"
