class Student:
    def __init__(self, name, age, grades):
        self.name = name
        self.age = age
        self.grades = grades
        self.avg_point = self.count_avg()
    def count_avg(self):
        return sum(self.grades)/len(self.grades)
    def status(self):
        if self.avg_point >= 8:
            return "This student very nice"
        elif self.avg_point >= 5:
            return "This student good"
        else:
            return "So so"

student_1 = Student("Vova", 18, [2, 8, 9, 5, 4])
student_2 = Student("Nata", 19, [3, 6, 8, 7])
student_3 = Student("Sasha", 22, [10, 6, 8])

print(student_1.avg_point, student_1.status())
print(student_2.avg_point, student_2.status())
print(student_3.avg_point, student_3.status())
