import os
import re
import string

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
    case 2:
        cli_input = input("Enter string: ")
        upper_char = "".join([up_char for up_char in cli_input if up_char.isupper()])
        lower_char = "".join([low_char for low_char in cli_input if low_char.islower()])
        digital_char = "".join([dig_char for dig_char in cli_input if dig_char.isdigit()])
        punctuation_char = "".join([punc_char for punc_char in cli_input if punc_char in string.punctuation])
        print(f"Upper character text: {upper_char}\n Character count: ", len(upper_char), f"\nLower character text: {lower_char}\n Character count: ", len(lower_char), f"\nDigital character: {digital_char}\n Character count: ", len(digital_char), f"\nPunctuation character: {punctuation_char}\n Character count: ", len(punctuation_char))

