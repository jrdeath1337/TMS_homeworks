#!/bin/bash

read -rp "Введите путь к файлу: " file_path

if [ ! -f "$file_path" ]; then
    echo "Файл не найден!"
    exit 1
fi

awk '{
    
    if (NF == 0) {
        print ""
        next
    }
    
    # Обрабатываем первое слово
    first_word = $1
    clean_first = tolower(first_word)
    sub(/\.$/, "", clean_first)
    
    result = first_word
    prev_clean = clean_first
    
    # Обрабатываем остальные слова
    for (i = 2; i <= NF; i++) {
        current_word = $i
        clean_current = tolower(current_word)
        sub(/\.$/, "", clean_current)
        
        if (clean_current != prev_clean) {
            result = result " " current_word
            prev_clean = clean_current
        }
        # Если слова совпадают - пропускаем
    }
    
    print result
}' "$file_path"
