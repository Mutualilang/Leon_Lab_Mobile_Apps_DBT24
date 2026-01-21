import 'dart:io';

void main() {
  print("Enter your choice (rock, paper, scissors):");
  String? user_input = stdin.readLineSync();
  String computer_choice;
  int random_number = DateTime.now().millisecondsSinceEpoch % 3;
  if (random_number == 0) {
    computer_choice = "rock";
  } else if (random_number == 1) {
    computer_choice = "paper";
  } else {
    computer_choice = "scissors";
  }
  print("Computer chose: $computer_choice");
  if (user_input == computer_choice) {
    print("Draw");
  } else if ((user_input == "rock" && computer_choice == "scissors") ||
      (user_input == "paper" && computer_choice == "rock") ||
      (user_input == "scissors" && computer_choice == "paper")) {
    print("win");
  } else {
    print("lose");
  }
}