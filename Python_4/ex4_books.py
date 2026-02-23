class Books:
    def __init__(self, book_id, name, author, age):
        self.name = name 
        self.author = author
        self.age = age
        self.book_id = book_id
    
    def edit_age(self, new_age):
        self.age = new_age
    def edit_author(self, new_author):
        self.author = new_author
    def edit_name(self, new_name):
        self.name = new_name
    def get_age(self):
        return self.age
    def get_author(self):
        return self.author
    def get_name(self):
        return self.name

books = {
        1: Books(1, "Book of the year", "Me", 2026),
        2: Books(2, "Book about DevOps", "TMS", 2025),
        3: Books(3, "Linux for kids", "Ketov", 2023),
        4: Books(4, "Networks in the world", "Atlassian", 2026)
        }

book_id = int(input(" Enter book ID: "))
choice_book = books.get(book_id)
if choice_book is None:
    print("Book not found")
else:
    choice = int(input("1 - Edit age\n2 - Edit author\n3 - Edit name\n4 - Get age\n5 - Get author\n6 - Get name\nENTER NUMBER: "))
    match choice:
        case 1:
            new_age = int(input("Enter new age: "))
            choice_book.edit_age(new_age)
        case 2:
            new_author = input("Enter new author: ")
            choice_book.edit_author(new_author)
        case 3:
            new_name = input("Enter new name: ")
            choice_book.edit_name(new_name)
        case 4:
            print(choice_book.get_age())
        case 5:
            print(choice_book.get_author())
        case 6:
            print(choice_book.get_name())
