import 'dart:io';
import 'dart:math';

void main() {
  print("Enter a number:");
  int? n = int.parse(stdin.readLineSync()!);
  int sum = 0;
  for (int i = 1; i <= n / 2; i++) {
    if (n % i == 0) {
      sum += i;
    }
  }
  if (sum == n) {
    print("$n is a Perfect number");
  } else {
    print("$n is NOT a Perfect number");
  }
}