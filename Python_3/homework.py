import os

print("info: multiply numbers")
arg1 = int(input("Input arg1: "))
arg2 = int(input("Input arg2: "))
def multiply_numbers(a,b):
    return a * b
sum_args = multiply_numbers(arg1,arg2)
print(sum_args)

print("info: work with text and file")
filename = input("Input filename: ")
with open(filename, "a", encoding="utf-8") as w:
    w.write("Это тестовый файл для домашего задания по программированию") 
with open(filename, "r", encoding="utf-8") as r:
    txt = r.read()
    print(txt)

dir_name = input("Input dirname: ")
os.system(f"bash -c 'mkdir -p {dir_name} && touch {dir_name}/file{{1..3}}.txt'")
files = os.listdir(dir_name)
for print_files in files:
    print(print_files)
