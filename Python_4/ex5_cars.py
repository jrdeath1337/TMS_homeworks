class Cars:
    def __init__(self, car_id, brand, model, color, year):
        self.brand = brand 
        self.model = model
        self.color = color
        self.car_id = car_id
        self.year = year
    
    def edit_brand(self, new_brand):
        self.brand = new_brand
    def edit_model(self, new_model):
        self.model = new_model
    def edit_color(self, new_color):
        self.color = new_color
    def edit_year(self, new_year):
        self.year = new_year
    def get_brand(self):
        return self.brand
    def get_model(self):
        return self.model
    def get_color(self):
        return self.color
    def get_year(self):
        return self.year

cars = {
        1: Cars(1, "Opel", "306", "yellow", 2006),
        2: Cars(2, "Lada", "niva", "green", 1986),
        3: Cars(3, "Zil", "2000", "haki", 1980),
        4: Cars(4, "Toyota", "hilux", "red", 2007),
        5: Cars(5, "Toyota", "celica", "black", 1997),

        }

car_id = int(input(" Enter car ID: "))
choice_car = cars.get(car_id)
if choice_car is None:
    print("Car not found")
else:
    choice = int(input("1 - Edit brand\n2 - Edit model \n3 - Edit color\n4 - Edit year\n5 - Get brand\n6 - Get model\n7 - Get color\n8 - Get year\nENTER NUMBER: "))
    match choice:
        case 1:
            new_brand = input("Enter new brand: ")
            choice_car.edit_brand(new_brand)
        case 2:
            new_model = input("Enter new model: ")
            choice_car.edit_model(new_model)
        case 3:
            new_color = input("Enter new color: ")
            choice_car.edit_color(new_color)
        case 4:
            new_year = int(input("Enter new year: "))
            choice_car.edit_year(new_year)
        case 5:
            print(choice_car.get_brand())
        case 6:
            print(choice_car.get_model())
        case 7:
            print(choice_car.get_color())
        case 8:
            print(choice_car.get_year())
