import os
import re
import string
import array
import statistics

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

    case 3:
        input_1 = input("Enter first list: ")
        list_1 = input_1.split()
        input_2 = input("Enter second list: ")
        list_2 = input_2.split()
        print(list_1, list_2)

    case 4:
        input_3 = input("Enter first list: ")
        sepnum_1 = input_3.split()
        num_1 = [int(x) for x in sepnum_1]
        array_1 = array.array('i', sorted(num_1, reverse=True))
        input_4 = input("Enter second list: ")
        sepnum_2 = input_4.split()
        num_2 = [int(x) for x in sepnum_2]
        array_2 = array.array('i', sorted(num_2, reverse=True))
        print(array_1, array_2)
    
    case 5: 
        input_5 = input("Enter data: ")
        sep_imput = tuple(input_5.split())
        if len(sep_imput) == len(set(sep_imput)):
            print(f"{sep_imput} - This tumple don't have duplicate")
        else:
            print(f"{sep_imput} - This tumple have duplicate ")

    case 6:
        dir_path = input("Enter dir path: ")
        grep_word = input("Enter text for searh: ")
        if os.path.exists(dir_path):
            files = set(os.listdir(dir_path))
            for grep_files in files:
                full_path = os.path.join(dir_path, grep_files)
                if os.path.isfile(full_path):
                    grep_sh = os.system(f"grep -i {grep_word} {full_path}")
                    print(grep_files, grep_sh)
                    if grep_sh != 0:
                        print("ERROR - text don't found")
        else:
            print("Don't found file or directory")

    case 7:
        str_1 = input("input first string: ")
        str_2 = input("input second string: ")
        common = set(str_1) & set(str_2)  
        print(f"Similar character: {common}")

    case 8:
        input_num = input("Enter numbers: ")
        sep_num = list(map(int, input_num.split()))
        print("Median", statistics.median(sep_num))
    
    case 9:
        text = input("Input text: ")
        vowels = "аеёиоуыэюяАЕЁИОУЫЭЮЯaeiouyAEIOUY" # Список всех гласных (рус + англ)
        result = ""
        for char in text:
            if char in vowels:
                result += "-"  # Если гласная — подменяем на дефис
            else:
                result += char # Если нет — оставляем как было
            f_result = result
        print(f"Result: {f_result}")

    case 10:
        str_1 = input("input first string: ")
        str_2 = input("input second string: ")
        common = list(set(str_1) & set(str_2))
        common1 = list(set(str_1) ^ set(str_2))
        print(f"Similar character: {common}, Uniq character: {common1}")


