import 'dart:io';
import 'dart:math';

void main() {
  print("Enter a number:");
  int? n = int.parse(stdin.readLineSync()!);
  bool isPrime = true;
  if (n <= 1) {
    isPrime = false;
  } else {
    for (int i = 2; i <= sqrt(n.toDouble()).toInt(); i++) {
      if (n % i == 0) {
        isPrime = false;
        break;
      }
    }
  }
  if (isPrime) {
    print("$n is a Prime number");
  } else {
    print("$n is NOT a Prime number");
  }
}