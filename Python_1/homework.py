#Задания указаны в сообщении info, пример: "info: ex*"
print("info: Greetings with user: ex 4")
import os
user = os.environ.get('USER')
print(f"Hello user {user} \nGood day for you\n")

print("info: simple sum calculate: ex 5")
a = int(input("Input first num: "))
b = int(input("Input second num: "))
print(f"Result: Num A + num B result:({a+b})\n")

print("info: Recognize your name: ex6 ")
name = input("Enter your name: ")
print(f"Result: Your name {name}, hello\n")

print("Work with cycle: ex7")
for i in range(10):
    print(f"Result: {i}")
print("")

print("Recognize your age: ex8")
age = int(input("Enter your age: "))
print(f"Result: Your age {age}")
if age >= 18:
    print(f"You adalt\n")
else:
    print(f"You yang\n")

print("info: simple multipli calculate: ex9")
c = int(input("Input first num: "))
d = int(input("Input second num: "))
print(f"Result: Num A * num B result:({c*d})\n")

print("info: simple square calculate: ex11 ")
f = int(input("Input num for squared: "))
print(f"Result: Num in squared result:({f*f})\n")

print("info: 5 multiplication table: ex12")
for x in range(11):
    print(f"Result: 5*{x}={x*5}")
print("")

print("info: simpe avarage calculated: ex13") 
y = int(input("Input first num: "))
z = int(input("Input second num: "))
n = y+z
p = n/len([y,z])
print(f"Result: Average: {p}\n")

print("info: calculating the first letter: ex10")
word = input("Input word: ")
print(f"Result: First letter {word} is {word[0]}\n")
