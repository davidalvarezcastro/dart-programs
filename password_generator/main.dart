import 'dart:math';

const MIN_LENGTH = 8;
const MAX_LENGTH = MIN_LENGTH * 2;

class CharacterGenerator {
  final int min;
  final int max;

  CharacterGenerator({required this.min, required this.max});

  String generate() {
    return String.fromCharCode(Random().nextInt(max - min) + min);
  }
}

class PasswordGenerator {
  final int minNum;
  final int maxNum;

  PasswordGenerator({required this.minNum, required this.maxNum});

  String generate(
      {required int size,
      bool numbers = false,
      bool capitalize = false,
      bool symbols = false}) {
    var password = "";

    List<CharacterGenerator?> generator = [
      CharacterGenerator(min: 97, max: 122),
      numbers ? CharacterGenerator(min: 48, max: 57) : null,
      capitalize ? CharacterGenerator(min: 65, max: 90) : null,
      symbols ? CharacterGenerator(min: 33, max: 47) : null,
      symbols ? CharacterGenerator(min: 58, max: 96) : null,
      symbols ? CharacterGenerator(min: 123, max: 125) : null,
    ].where((element) => element != null).toList();

    for (var i = 0; i < min(max(size, this.minNum), this.maxNum); i++) {
      int random = Random().nextInt(generator.length);
      password += generator[random]!.generate();
    }

    return password;
  }
}

void main(List<String> args) {
  var generator = PasswordGenerator(maxNum: MAX_LENGTH, minNum: MIN_LENGTH);

  var pwd = generator.generate(
      size: 8, capitalize: true, symbols: true, numbers: true);
  print("Password: $pwd");
}
