
import 'dart:io';

/// Gryffindor - Bravery
/// Hufflepuff - Loyalty
/// Ravenclaw - Curiosity
/// Slytherin - Ambition
enum HogwartsHouses { Gryffindor, Hufflepuff, Ravenclaw, Slytherin }

final List<HatQuestion> questions = [
    HatQuestion(question: "1. Favourite class at Hogwarts?", answers: [
      Tuple2<String, HogwartsHouses>("Flying lessons", HogwartsHouses.Gryffindor),
      Tuple2<String, HogwartsHouses>("Potions", HogwartsHouses.Ravenclaw),
      Tuple2<String, HogwartsHouses>("Defence Against the Dark Arts", HogwartsHouses.Slytherin),
      Tuple2<String, HogwartsHouses>("Care of Magical Creatures", HogwartsHouses.Hufflepuff),
    ]),
    HatQuestion(question: "2. Define yourself with one word", answers: [
      Tuple2<String, HogwartsHouses>("Wise", HogwartsHouses.Ravenclaw),
      Tuple2<String, HogwartsHouses>("Ambitious", HogwartsHouses.Slytherin),
      Tuple2<String, HogwartsHouses>("Loyal", HogwartsHouses.Hufflepuff),
      Tuple2<String, HogwartsHouses>("Brave", HogwartsHouses.Gryffindor),
    ]),
    HatQuestion(question: "3. Favourite color?", answers: [
      Tuple2<String, HogwartsHouses>("Green", HogwartsHouses.Slytherin),
      Tuple2<String, HogwartsHouses>("Orange", HogwartsHouses.Hufflepuff),
      Tuple2<String, HogwartsHouses>("Blue", HogwartsHouses.Ravenclaw),
      Tuple2<String, HogwartsHouses>("Red", HogwartsHouses.Gryffindor),
    ]),
    HatQuestion(question: "4. Where would you spend more time?", answers: [
      Tuple2<String, HogwartsHouses>("Greenhouse", HogwartsHouses.Hufflepuff),
      Tuple2<String, HogwartsHouses>("Library", HogwartsHouses.Ravenclaw),
      Tuple2<String, HogwartsHouses>("Exploring", HogwartsHouses.Gryffindor),
      Tuple2<String, HogwartsHouses>("Dungeon", HogwartsHouses.Slytherin),
    ]),
    HatQuestion(question: "5. What kind of instrument most pleases your ear?", answers: [
      Tuple2<String, HogwartsHouses>("Violin", HogwartsHouses.Slytherin),
      Tuple2<String, HogwartsHouses>("Drum", HogwartsHouses.Gryffindor),
      Tuple2<String, HogwartsHouses>("Piano", HogwartsHouses.Ravenclaw),
      Tuple2<String, HogwartsHouses>("Trumpet", HogwartsHouses.Hufflepuff),
    ]),
    HatQuestion(question: "6. Which of the following would you most like to study?", answers: [
      Tuple2<String, HogwartsHouses>("Goblins", HogwartsHouses.Ravenclaw),
      Tuple2<String, HogwartsHouses>("Vampires", HogwartsHouses.Slytherin),
      Tuple2<String, HogwartsHouses>("Trolls", HogwartsHouses.Hufflepuff),
      Tuple2<String, HogwartsHouses>("Ghosts", HogwartsHouses.Gryffindor),
    ]),
  ];

class Tuple2<T1, T2> {
  final T1 item1;
  final T2 item2;

  const Tuple2(this.item1, this.item2);

  List toList({bool growable = false}) =>
      List.from([item1, item2], growable: growable);

  @override
  String toString() => '[$item1, $item2]';
}

class HatQuestion {
  late String question;
  late List<Tuple2<String, HogwartsHouses>> answers;

  HatQuestion({required this.question, required this.answers});

  int getAnswer() {
    for (var i = 0; i < answers.length; i++) {
      print("\t ${i+1}. ${answers[i].item1}");
    }
    print("   Answer 1, 2, 3 o 4: ");
    String? answer = stdin.readLineSync();
    if (answer == "1" || answer == "2" || answer == "3" || answer == "4") {
        return int.parse(answer!)-1;
    }

    return getAnswer();
  }

}

class QuestionsRepository {
  late List<HatQuestion> questions;
  Map<HogwartsHouses, int> points = {};

  QuestionsRepository({required this.questions}) {
    for (var house in HogwartsHouses.values) {
      points[house] = 0;
    }
  }

  /// gets the house name from [question] by using user [answer]
  void addQuestion({required HatQuestion question, required int answer}) {
    HogwartsHouses winner = question.answers[answer].item2;
    points[winner] = points[winner]! + 1;
  }

  /// inits sorting hat questions
  void init() {
    for (var question in questions) {
      int answer = question.getAnswer();
      addQuestion(question: question, answer: answer);
    }
  }

  /// gets winner name
  String getWinner() {
    return points.entries.fold(
      Tuple2(HogwartsHouses.Gryffindor,  0), (max, e) => e.value > max.item2 ? Tuple2(e.key,  e.value) : max
    ).item1.name;
  }
}

void main(List<String> args) {
  QuestionsRepository game = QuestionsRepository(questions: questions);
  game.init();
  String winner = game.getWinner();
  print("Your new home is ... $winner!!");
}
