money_case = int(input("If you wanna replenishment input 1, if you wanna withdrawal input 2: "))
count_money = float(input("Enter the required amount: "))
class Bank_account:
    def __init__(self, account_number, owner_name, balance):
        self.account_number = account_number
        self.owner_name = owner_name
        self.balance = balance
    def withdrawal(self, amount):
        if amount > self.balance:
            print("No founds")
        else:
            self.balance -= amount
            print(self.owner_name, "withdrawal: ", amount, "balance now: ", self.balance)
    def replenishment(self, amount):
            self.balance += amount 
            print(self.owner_name, "replenishment: ", amount, "\nBalance now: ", self.balance)
my_account = Bank_account(1, "Dima", 10000000)
if money_case == 1:
    my_account.replenishment(count_money)
elif money_case == 2:
    my_account.withdrawal(count_money)
else:
    print("ERROR: incorrect input")
