
import 'dart:io';
import 'dart:math';

final TRIES = 3;
final WORDS = ["home", "car", "apple", "food", "queen", "power"];


String getWord({required String word}) {
  int hidden_letters = (word.length * 0.6).toInt();

  var hidden_word = "";

  var hidden_positions = [];
  while (hidden_positions.length != hidden_letters) {
    final index = Random().nextInt(word.length);
    
    if (!hidden_positions.contains(index)) {
      hidden_positions.add(index);
    }
  }

  word.split("").asMap().forEach((index, letter) => {
      hidden_word += hidden_positions.contains(index) ? "_" : letter
  });

  return hidden_word;
}

List<int> checkLetter({required String word, required String letter}) {
  List<int> indexes = [];
  word.split("").asMap().forEach((key, value) {
    if (value == letter) indexes.add(key);
  });
  return indexes;
}

void main(List<String> args) {
  int current_try = 0;
  bool won = false;
  String word = (WORDS..shuffle()).first;
  var new_hidden_word = "";
  var hidden_word = getWord(word: word);


  while (!won && current_try < TRIES) {
    print("\n${hidden_word}\n");
    print("Write a letter or the full word: ");
    String? answer = stdin.readLineSync();
    if (answer!.isNotEmpty && (answer.length == 1 || answer.length == hidden_word.length)) {
        if (answer.length == 1) { // case 1: letter
          new_hidden_word = "";
          final matches = checkLetter(word: word, letter: answer);

          if(matches.length > 0) {
            hidden_word.split("").asMap().forEach((index, letter) => {
                new_hidden_word += matches.contains(index) ? answer : letter
            });
          } else {
            current_try++;
            new_hidden_word = hidden_word;
          }

          hidden_word = new_hidden_word;
        } else { // case 2: full word
          if (answer == word) {
            won = true;
          } else {
            current_try++;
          }
        }

        if (hidden_word == word) {
          won = true;
        }
    } else {
      print("Something was wrong!");
      current_try++;
    }
  }

  if (won) {
    print("Congratulations!! You won! Result: ${word}");
  } else {
    print("Maybe next time! Result: ${word}");
  }
}
