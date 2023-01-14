const P1 = 'P1';
const P2 = 'P2';

class Player {
  int score = 0;
  bool winner = false;
  Player();
}

class TennisMath {
  late List<String> _sequence = [];
  late Map<String, Player> _players;
  final scores = ["love", "15", "30", "40"];
  List<String> _output = [];
  int _stage = 0;
  bool deuce = false;
  int _finished = 0;

  TennisMath({required sequence}) : _sequence = sequence;

  List<String> get sequence {
    return _sequence;
  }

  void set sequence(List<String> sequence) {
    _sequence = sequence;
  }

  List<String> get output {
    return _output;
  }

  int get finished {
    return _finished;
  }

  bool _checkData() {
    return _sequence.every((element) => element == P1 || element == P2);
  }

  String getScore(int index) {
    return scores[index];
  }

  void init() {
    if (_checkData()) {
      _players = {
        P1: Player(),
        P2: Player(),
      };

      next();
    } else {
      print("Input data invalid!");
    }
  }

  void next() {
    String player = _sequence[_stage];

    if (player == P1)
      _players[P1]!.score++;
    else
      _players[P2]!.score++;

    if (_players[P1]!.score == 3 && _players[P2]!.score == 3) {
      deuce = true;
    } else {
      if (!deuce) {
        _players[P1]!.winner = _players[P1]!.score > 3;
        _players[P2]!.winner = _players[P2]!.score > 3;
      }
    }

    if (!deuce && (!_players[P1]!.winner && !_players[P2]!.winner)) {
      _output.add(
          "${getScore(_players[P1]!.score)} - ${getScore(_players[P2]!.score)}");
    } else if (deuce) {
      switch (_players[P1]!.score - _players[P2]!.score) {
        case 0:
          _output.add("Deuce");
          break;
        case 1:
          _output.add("AD P1");
          break;
        case 2:
          _players[P1]!.winner = true;
          break;
        case -1:
          _output.add("AD P2");
          break;
        case -2:
          _players[P2]!.winner = true;
          break;
        default:
      }
    }

    if (_players[P1]!.winner || _players[P2]!.winner) {
      if (_players[P1]!.winner) {
        _output.add("P1 won!");
      } else {
        _output.add("P2 won!");
      }
    }

    if (!_players[P1]!.winner && !_players[P2]!.winner) {
      _stage++;
      if (_stage < _sequence.length) {
        next();
      } else {
        _finished = 0;
      }
    } else {
      _finished = 1;
    }
  }
}

void main(List<String> args) {
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

  TennisMath tennis_match = TennisMath(sequence: sequence);
  tennis_match.init();

  if (tennis_match.finished == 1) {
    print(tennis_match.output);
  } else {
    print("Match unfinished!");
  }
}
