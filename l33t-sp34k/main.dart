final Map<String, String> vocabulary = {
  'a': '4',
  'b': '13',
  'c': '[',
  'd': ')',
  'e': '3',
  'f': '|=',
  'g': '&',
  'h': '#',
  'i': '1',
  'j': ',_|',
  'k': '>|',
  'l': '1',
  'm': '/\\/\\',
  'n': '^/',
  'o': '0',
  'p': '|*',
  'q': '(_,)',
  'r': 'I2',
  's': '5',
  't': '7',
  'u': '(_)',
  'v': '\\/',
  'w': '\\/\\/',
  'x': '><',
  'y': 'j',
  'z': '2',
};

class Encoder {
  late Map<String, String> _vocabulary = {};

  Encoder({required vocabulary}) : _vocabulary = vocabulary;

  set vocabulary(Map<String, String> vocabulary) {
    print("aklsdhasjkd");
    _vocabulary = vocabulary;
  }

  /// Returns [input] encoded using [_vocabulary] vocabulary
  String encode(String input) {
    String result = '';

    input.toLowerCase().runes.forEach((c) {
      var character = new String.fromCharCode(c);
      result += (this._vocabulary.containsKey(character)
          ? this._vocabulary[character] ?? character
          : character);
    });

    return result;
  }
}

void main(List<String> args) {
  String input = "Hello!! Program developed by davalv";
  Encoder e = Encoder(vocabulary: vocabulary);

  print("Plain text: ${input}");
  print("Encoded text: ${e.encode(input)}");
}
