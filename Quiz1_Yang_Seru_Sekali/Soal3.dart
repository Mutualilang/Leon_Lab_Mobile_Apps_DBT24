import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int target = random.nextInt(100) + 1;
  int guess;
  do {
    print("tebak angka antara 1 sampai 100:");
    guess = int.parse(stdin.readLineSync()!);
    if (guess < target) {
      print("Terlalu rendah");
    } else if (guess > target) {
      print("Terlalu tinggi");
    } else {
      print("Korek");
    }
  } while (guess != target);
}