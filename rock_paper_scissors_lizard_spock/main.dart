const PLAYER1 = "Player 1";
const PLAYER2 = "Player 2";
const TIE = "Tie";

class Tuple2<T1, T2> {
  final T1 item1;
  final T2 item2;

  const Tuple2(this.item1, this.item2);

  List toList({bool growable = false}) =>
      List.from([item1, item2], growable: growable);

  @override
  String toString() => '[$item1, $item2]';
}

class RPSLPShift {
  final Map<String, List<String>> rules = {
    "🦎": [
      "🖖", "📄"
    ],
    "🖖": [
      "✂️", "🗿"
    ],
    "✂️": [
      "📄", "🦎"
    ],
    "📄": [
      "🖖", "🗿"
    ],
    "🗿": [
      "✂️", "🦎"
    ]
  };

  int check(Tuple2<String, String> data) {
    if (!rules.containsKey(data.item1) || !rules.containsKey(data.item2)) throw new Exception("item not found!");

    return data.item1 == data.item2 ? 0 : 
      (rules[data.item1]!.contains(data.item2) ? 1 : -1);
  }

}

class RPSLPGame {
  late List<Tuple2<String, String>> data;
  final RPSLPShift shiftManager = RPSLPShift();

  RPSLPGame({required List<Tuple2<String, String>> this.data});

  int _checkGame() {
    int result = 0;
    if (data.length != 3) throw new Exception("the size of the shifts must be 3!");

    for (var i = 0; i < data.length; i++) {
      result += shiftManager.check(data[i]);

      if (result.abs() > 1) break;
    }

    return result;
  }

  String getWinner() {
    int result = _checkGame();

    return result == 0 ? TIE : (result > 0  ? PLAYER1 : PLAYER2);
  }
}

void main(List<String> args) {
  List<Tuple2<String, String>> shifts = [
    Tuple2("🖖", "✂️"),
    Tuple2("🦎", "📄"),
    Tuple2("📄", "🗿"),
  ];

  RPSLPGame game = RPSLPGame(data: shifts);
  String winner = game.getWinner();
  print("Winner: $winner! Congrats!");
}
