#Просто выберите задание для проверки по его номеру в ДЗ
exercise = int(input("4 - hello\n5 - a+b\n6 - name\n7 - for(1-10)\n8 - age\n9 - a*b\n10 - first letter\n11 - squared\n12 - multiplication table\n13 - average\nSelect exersice: "))
match exercise:
    case 4:
        print("info: Greetings with user")
        import os
        user = os.environ.get('USER')
        print(f"Hello user {user} \nGood day for you\n")

    case 5:
        print("info: simple sum calculate")
        a = int(input("Input first num: "))
        b = int(input("Input second num: "))
        print(f"Result: Num A + num B result:({a+b})\n")

    case 6:
        print("info: Recognize your name")
        name = input("Enter your name: ")
        print(f"Result: Your name {name}, hello\n")

    case 7:
        print("Work with cycle")
        for i in range(10):
            print(f"Result: {i}")

    case 8:
        print("Recognize your age")
        age = int(input("Enter your age: "))
        print(f"Result: Your age {age}")
        if age >= 18:
            print(f"You adalt\n")
        else:
            print(f"You yang\n")

    case 9:
        print("info: simple multipli calculate")
        c = int(input("Input first num: "))
        d = int(input("Input second num: "))
        print(f"Result: Num A * num B result:({c*d})\n")

    case 11:
        print("info: simple square calculate")
        f = int(input("Input num for squared: "))
        print(f"Result: Num in squared result:({f*f})\n")

    case 12:
        print("info: 5 multiplication table")
        for x in range(11):
            print(f"Result: 5*{x}={x*5}")

    case 13:
        print("info: simpe average calculated") 
        y = int(input("Input first num: "))
        z = int(input("Input second num: "))
        n = y+z
        p = n/len([y,z])
        print(f"Result: Average: {p}\n")

    case 10:
        print("info: calculating the first letter")
        word = input("Input word: ")
        print(f"Result: First letter {word} is {word[0]}\n")
