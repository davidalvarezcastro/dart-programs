import 'package:test/test.dart';

import 'main.dart';

void main() {
  test('tennis match 1', () {
    List<String> sequence = ["P1", "P1", "P2", "P2", "P1", "P2", "P1", "P1"];
    List<String> result = [
      "15 - love",
      "30 - love",
      "30 - 15",
      "30 - 30",
      "40 - 30",
      "Deuce",
      "AD P1",
      "P1 won!"
    ];
    TennisMath tennis_match = TennisMath(sequence: sequence);
    tennis_match.init();

    expect(tennis_match.finished, 1);
    expect(tennis_match.output, result);
  });

  test('tennis match 2', () {
    List<String> sequence = [
      "P1",
      "P1",
      "P2",
      "P2",
      "P1",
      "P2",
      "P1",
      "P2",
      "P2",
      "P2"
    ];
    List<String> result = [
      "15 - love",
      "30 - love",
      "30 - 15",
      "30 - 30",
      "40 - 30",
      "Deuce",
      "AD P1",
      "Deuce",
      "AD P2",
      "P2 won!"
    ];
    TennisMath tennis_match = TennisMath(sequence: sequence);
    tennis_match.init();

    expect(tennis_match.finished, 1);
    expect(tennis_match.output, result);
  });

  test('tennis match 3', () {
    List<String> sequence = [
      "P1",
      "P1",
      "P2",
      "P2",
      "P1",
      "P2",
      "P1",
      "P2",
      "P2",
      "P1"
    ];
    List<String> result = [
      "15 - love",
      "30 - love",
      "30 - 15",
      "30 - 30",
      "40 - 30",
      "Deuce",
      "AD P1",
      "Deuce",
      "AD P2",
      "Deuce"
    ];
    TennisMath tennis_match = TennisMath(sequence: sequence);
    tennis_match.init();

    expect(tennis_match.finished, 0);
    expect(tennis_match.output, result);
  });

  test('tennis match 4', () {
    List<String> sequence = [
      "P1",
      "P1",
      "P1",
      "P2",
      "P1",
    ];
    List<String> result = [
      "15 - love",
      "30 - love",
      "40 - love",
      "40 - 15",
      "P1 won!",
    ];
    TennisMath tennis_match = TennisMath(sequence: sequence);
    tennis_match.init();

    expect(tennis_match.finished, 1);
    expect(tennis_match.output, result);
  });
}
