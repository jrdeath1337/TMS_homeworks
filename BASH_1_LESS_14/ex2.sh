#!/usr/bin/bash
#Check root permisson
if [[ $(id -u) != 0 ]]; then
  echo "root permisson required" >&2
  exit 1 
fi 

#Variables  
shell=/sbin/nologin
file=/var/users
oldIFS=$IFS 

#Function
create_user() {

#Restore IFS
IFS=$oldIFS

#Create group
groupadd $group

#Sudoers 
if [[ "$group" = it || $group = security ]]; then
  if ! grep "^%$group" /etc/sudoers; then
    cp /etc/sudoers{,.bkp}
    echo "%$group ALL=(ALL) ALL" >> /etc/sudoers
  fi 
 local shell=/bin/bash
elif [[ $user = admin ]]; then
  if ! grep $user /etc/sudoers; then
  cp /etc/sudoers{,.bkp}
  echo "$user 'ALL=(ALL) ALL'" >> /etc/sudoers
  fi
  shell=/bin/bash
fi 

mkdir /home/"$group"
useradd "$user" -g "$group" -b /home/"$group" -s "$shell"
}

#Check parametrs
if  [[ ! -z $2 ]]; then 
  user=$1
  group=$2 
  echo Username: $user Group: $group 
elif [[ -f $file ]]; then 
 IFS=$'\n'
 for line in $(cat /var/users); do
  user=$(echo $line | cut -d' ' -f1)
  group=$(echo $line | cut -d' ' -f2)
  echo Username: $user Groupname: $group
  create_user
done 
 else
  echo "Welcome!"
  select option in "Add user" "Show user" "Exit"; do
    case $option in
    "Add user")
                read -p "Print username: " user
                read -p "Print groupname: " group
                create_user;;
    "Show user")
                cut -d: -f1 /etc/passwd ;;
    "Exit")
                break ;;
    *)
                echo "Wrong option" ;;
    esac 
 done
