print("info: Greetings with user")
import os
user = os.environ.get('USER')
print(f"Hello user {user} \nGood day for you\n")

print("info: simple sum calculate ")
a = int(input("Input first num: "))
b = int(input("Input second num: "))
print(f"info: \nnum A + num B result:({a+b})\n")

print("info: Recognize your name ")
name = input("Enter your name: ")
print(f"Your name {name}, hello\n")

print("Work with cycle")
for i in range(10):
    print(f"{i}")
print("")

print("Recognize your age")
age = int(input("Enter your age: "))
print(f"Your age {age}")
if age >= 18:
    print(f"You adalt\n")
else:
    print(f"You yang\n")

print("info: simple multipli calculate")
c = int(input("Input first num: "))
d = int(input("Input second num: "))
print(f"info: \n num A * num B result:({c*d})\n")

print("info: simple square calculate ")
f = int(input("Input num for squared: "))
print(f"info: \nnum in squared result:({f*f})\n")

print("info: 5 multiplication table")
for x in range(11):
    print(f"result: 5*{x}={x*5}\n")
print("")

print("info: simpe avarage calculated") 
y = int(input("Input first num: "))
z = int(input("Input second num: "))
n = y+z
p = n/len([y,z])
print(f"info: avarage: {p}\n")

print("info: calculating the first letter")
word = input("Input word: ")
print(f"First letter {word} is {word[0]}\n")
