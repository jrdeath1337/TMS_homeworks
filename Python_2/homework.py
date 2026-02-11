import os
import re

exercise = int(input("Выберите номер задания для проверки: "))
match exercise:
    case 1:
        file = input("Enter file name: ")
        with open(file, 'r', encoding="utf-8") as f:
            ip_adresses = f.read()
            ip_sort = set(re.findall(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}', ip_adresses))
            for ip_ping in ip_sort:
                ping_sh = os.system(f"ping -c 1 -W 1 {ip_ping}")
                if ping_sh == 0:
                    with open('access_adresses.log', 'a', encoding='utf-8') as log:
                        log.write(f"Adress: {ip_ping} ACCESS\n")
                else:
                    with open('access_adresses.log', 'a', encoding='utf-8') as log:
                        log.write(f"Adress: {ip_ping} NOT ACCESS\n")
