void main() {
  Account akun = Account();

  akun.deposit(7000);
  akun.withdraw(233);

  print("Final balance: ${akun.balance}");
}

class Account {
  int balance = 0;

  void deposit(int amount) {
    balance = balance + amount;
  }

  void withdraw(int amount) {
    if (balance - amount >= 0) {
      balance = balance - amount;
    } else {
      print("Saldo tidak cukup");
    }
  }
}