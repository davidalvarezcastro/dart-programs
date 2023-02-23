import 'package:test/test.dart';

import 'main.dart';

void main() {
  test('sorting hat Harry Potter I', () {
    QuestionsRepository game = QuestionsRepository(questions: questions);

    // simulate answers
    game.addQuestion(question: questions[0], answer: 2);
    game.addQuestion(question: questions[1], answer: 1);
    game.addQuestion(question: questions[2], answer: 2);
    game.addQuestion(question: questions[3], answer: 2);
    game.addQuestion(question: questions[4], answer: 0);
    game.addQuestion(question: questions[5], answer: 1);

    String winner = game.getWinner();
    expect(winner, HogwartsHouses.Slytherin.name);
  });
  test('sorting hat Harry Potter II', () {
    QuestionsRepository game = QuestionsRepository(questions: questions);

    // simulate answers
    game.addQuestion(question: questions[0], answer: 3);
    game.addQuestion(question: questions[1], answer: 2);
    game.addQuestion(question: questions[2], answer: 0);
    game.addQuestion(question: questions[3], answer: 3);
    game.addQuestion(question: questions[4], answer: 1);
    game.addQuestion(question: questions[5], answer: 2);

    String winner = game.getWinner();
    expect(winner, HogwartsHouses.Hufflepuff.name);
  });
  test('sorting hat Harry Potter III', () {
    QuestionsRepository game = QuestionsRepository(questions: questions);

    // simulate answers
    game.addQuestion(question: questions[0], answer: 0);
    game.addQuestion(question: questions[1], answer: 0);
    game.addQuestion(question: questions[2], answer: 0);
    game.addQuestion(question: questions[3], answer: 0);
    game.addQuestion(question: questions[4], answer: 0);
    game.addQuestion(question: questions[5], answer: 0);

    String winner = game.getWinner();
    expect(winner, HogwartsHouses.Ravenclaw.name);
  });
  test('sorting hat Harry Potter IV', () {
    QuestionsRepository game = QuestionsRepository(questions: questions);

    // simulate answers
    game.addQuestion(question: questions[0], answer: 0);
    game.addQuestion(question: questions[1], answer: 1);
    game.addQuestion(question: questions[2], answer: 2);
    game.addQuestion(question: questions[3], answer: 3);
    game.addQuestion(question: questions[4], answer: 2);
    game.addQuestion(question: questions[5], answer: 1);

    String winner = game.getWinner();
    expect(winner, HogwartsHouses.Slytherin.name);
  });
}
