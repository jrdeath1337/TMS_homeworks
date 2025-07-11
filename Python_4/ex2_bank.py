money_case = int(input("If you wanna replenishment input 1, if you wanna withdrawal input 2: "))
count_money = float(input("Enter the required amount: "))
login = input("Enter your name: ")
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

accounts = {
    "Dima": Bank_account(1, "Dima", 10000000),
    "Vika": Bank_account(2, "Vika", 12321121)
}

selected_account = accounts.get(login) 

if selected_account is None:
    print("Account not found")
else:
    if money_case == 1:
        selected_account.replenishment(count_money)
    elif money_case == 2:
        selected_account.withdrawal(count_money)
    else:
        print("ERROR: incorrect input")
