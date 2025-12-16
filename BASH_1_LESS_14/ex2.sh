#!/usr/bin/bash

# Проверяем root по его id 
if [[ $(id -u) != 0 ]]; then
  echo "root permission required" >&2
  exit 1 
fi 

# Устанавливаем переменные   
shell=/sbin/nologin
file=/var/users
oldIFS=$IFS 

# Функция для создания юзеров
create_user() {
    local user="$1"
    local group="$2"
    local shell=$3
    
    # Создаем группу если не находим её в файле 
    if ! grep -q "^$group:" /etc/group; then
        groupadd "$group"
    fi

    # Добавляем sudo юзеров если они в нужных группах 
    if [[ "$group" = "it" || "$group" = "security" ]]; then
        if ! grep -q "^%$group" /etc/sudoers; then
            cp /etc/sudoers /etc/sudoers.bkp
            echo "%$group ALL=(ALL) ALL" >> /etc/sudoers
        fi 
        shell=/bin/bash
    elif [[ "$user" = "admin" ]]; then
        if ! grep -q "^$user" /etc/sudoers; then
            cp /etc/sudoers /etc/sudoers.bkp
            echo "$user ALL=(ALL) ALL" >> /etc/sudoers
        fi
        shell=/bin/bash
    fi 

    # Создаем домашнюю директорию при ее отсутствии 
    if [[ ! -d "/home/$group" ]]; then
        mkdir -p "/home/$group"
    fi
    
    # Создаем нового юзера или указываем что такой уже существует
    if ! id "$user" &>/dev/null; then
        useradd "$user" -g "$group" -b "/home/$group" -s "$shell"
        echo "User $user created successfully"
    else
        echo "User $user already exists"
    fi
}

# Основная часть скрипта 
if [[ $# -eq 2 ]]; then     #Если кол-во аргументов равняется 2 (юзер и группа), создаем группу вызывая функцию
    user=$1
    group=$2 
    echo "Username: $user Group: $group"
    create_user "$user" "$group" "$shell"
elif [[ -f "$file" ]]; then     #Если в аргумент передан файл, работаем с файлом 
    IFS=$'\n'
    for line in $(cat "$file"); do
        user=$(echo "$line" | cut -d' ' -f1)
        group=$(echo "$line" | cut -d' ' -f2)
        echo "Username: $user Groupname: $group"
        create_user "$user" "$group" "$shell"
    done
    IFS=$oldIFS
else
    echo "Welcome!"
    select option in "Add user" "Show user" "Exit"; do
        case $option in   #Кейсы для интерактива 
            "Add user")
                read -p "Print username: " user
                read -p "Print groupname: " group
                create_user "$user" "$group" "$shell"
                ;;
            "Show user")
                cut -d: -f1 /etc/passwd 
                ;;
            "Exit")
                break 
                ;;
            *)
                echo "Wrong option" 
                ;;
        esac 
    done
fi
