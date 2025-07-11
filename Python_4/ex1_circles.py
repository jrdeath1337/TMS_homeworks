print("info: Work with circles")
class Circle:
    def __init__ (self, radius, color):
        self.radius = radius
        self.color = color
        
    def area(self):
        return 3.14 * (self.radius ** 2)

circle_1 = Circle(10, "Blue")
circle_2 = Circle(22, "Green")

print("First circle radius: ", circle_1.area(), "\nSecond circle radius: ", circle_2.area())
