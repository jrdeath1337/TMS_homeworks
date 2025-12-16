#!/usr/bin/bash

# Check root permission
if [[ $(id -u) != 0 ]]; then
  echo "root permission required" >&2
  exit 1 
fi 

# Variables  
shell=/sbin/nologin
file=/var/users
oldIFS=$IFS 

# Function
create_user() {
    local user="$1"
    local group="$2"
    local shell=$3
    
    # Create group if it doesn't exist
    if ! grep -q "^$group:" /etc/group; then
        groupadd "$group"
    fi

    # Sudoers configuration
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

    # Create home directory if it doesn't exist
    if [[ ! -d "/home/$group" ]]; then
        mkdir -p "/home/$group"
    fi
    
    # Create user
    if ! id "$user" &>/dev/null; then
        useradd "$user" -g "$group" -b "/home/$group" -s "$shell"
        echo "User $user created successfully"
    else
        echo "User $user already exists"
    fi
}

# Main script logic
if [[ $# -eq 2 ]]; then 
    user=$1
    group=$2 
    echo "Username: $user Group: $group"
    create_user "$user" "$group" "$shell"
elif [[ -f "$file" ]]; then 
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
        case $option in
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
