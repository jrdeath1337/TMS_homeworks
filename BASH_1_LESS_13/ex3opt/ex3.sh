#!/usr/bin/bash

read -p "Choose text file or type email: " textfile

grep -o -E '[a-zA-Z0-9.,+\-]+@[a-zA-Z0-9.\-]+' "$textfile" | awk ' #Вытаскиваем адреса из текста с помощью grep 
{
    email = $0 #Email вся строка
    if (email ~ /\.\./) next #Если есть 2 точки идем дальше
    if (email ~ /@.*@/) next #Если есть 2 @ идем дальше
    
    split(email, parts, "@") #Делим адрес на 2 части через сепаратор @
    if (length(parts) != 2) next #Если не выходит 2 частей идем дальше
    
    local = parts[1] #Первая часть
    domain = parts[2] #Вторая часть
    
    if (length(local) > 64 || length(domain) > 255) next #Проверка длинны 2 частей
    if (local ~ /^[.,+\-]/ || local ~ /[.,+\-]$/) next #Проверка первой части на запрещенные символы
    if (domain ~ /^[.,\-]/ || domain ~ /[.,\-]$/) next #Проверка второй части на запрещенные символы
    if (local ~ /[^a-zA-Z0-9.,+\-]/) next #Если первая часть не содержит указанных символов
    if (domain ~ /[^a-zA-Z0-9.\-]/) next #Если вторая часть не содержит указанных символов
    
    print email
}' | sort -u #Оставляем только уникальные адреса
