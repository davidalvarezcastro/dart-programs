import 'package:test/test.dart';

import 'main.dart';

void main() {
  test('rock paper scissors lizard spock I', () {
    List<Tuple2<String, String>> shifts = [
      Tuple2("✂️", "✂️"),
      Tuple2("✂️", "📄"),
      Tuple2("📄", "🗿"),
    ];

    RPSLPGame game = RPSLPGame(data: shifts);
    String winner = game.getWinner();
    expect(winner, PLAYER1);
  });

  test('rock paper scissors lizard spock II', () {
    List<Tuple2<String, String>> shifts = [
      Tuple2("✂️", "✂️"),
      Tuple2("✂️", "📄"),
      Tuple2("✂️", "🖖"),
    ];

    RPSLPGame game = RPSLPGame(data: shifts);
    String winner = game.getWinner();
    expect(winner, TIE);
  });

  test('rock paper scissors lizard spock III', () {
    List<Tuple2<String, String>> shifts = [
      Tuple2("🦎", "🗿"),
      Tuple2("🖖", "📄"),
      Tuple2("📄", "🗿"),
    ];

    RPSLPGame game = RPSLPGame(data: shifts);
    String winner = game.getWinner();
    expect(winner, PLAYER2);
  });

  test('rock paper scissors lizard spock IV', () {
    List<Tuple2<String, String>> shifts = [
      Tuple2("🖖", "🗿"),
      Tuple2("🖖", "📄"),
      Tuple2("🖖", "✂️"),
    ];

    RPSLPGame game = RPSLPGame(data: shifts);
    String winner = game.getWinner();
    expect(winner, PLAYER1);
  });

  test('rock paper scissors lizard spock V', () {
    List<Tuple2<String, String>> shifts = [
      Tuple2("🖖", "🖖"),
      Tuple2("📄", "📄"),
      Tuple2("✂️", "✂️"),
    ];

    RPSLPGame game = RPSLPGame(data: shifts);
    String winner = game.getWinner();
    expect(winner, TIE);
  });
}
