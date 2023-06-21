final AUREBESH_ALPHABET = {
  "a": "aurek",
  "b": "besh",
  "c": "cresh",
  "d": "dorn",
  "e": "esk",
  "f": "forn",
  "g": "grek",
  "h": "herf",
  "i": "isk",
  "j": "jenth",
  "k": "krill",
  "l": "leth",
  "m": "merm",
  "n": "nern",
  "o": "osk",
  "p": "peth",
  "q": "qek",
  "r": "resh",
  "s": "senth",
  "t": "trill",
  "u": "usk",
  "v": "vev",
  "w": "wesk",
  "x": "xesh",
  "y": "yirt",
  "z": "zerek",
  "ae": "enth",
  "eo": "onith",
  "kh": "krenth",
  "ng": "nen",
  "oo": "orenth",
  "sh": "sen",
  "th": "thesh"
};

class Interpreter {
  late Map<String, String> _vocabulary;

  Interpreter({required vocabulary}) : _vocabulary = vocabulary;

  set vocabulary(Map<String, String> vocabulary) {
    _vocabulary = vocabulary;
  }

  String _translate({required String sentence, required bool origin}) {
    String result = '';

    if (origin) {
      result = sentence;
      var aurebesh_vocabulary = {};
      _vocabulary.forEach((key, value) {
        aurebesh_vocabulary[value] = key;
      });
      
      aurebesh_vocabulary.forEach((key, value) {
        result = result.replaceAll(key, value);
      });
    } else {
      final text_len = sentence.length;
      final unicode_sentence = sentence.toLowerCase().runes;

      var index = 0;

      while (index < text_len) {
        var simple_character = new String.fromCharCode(unicode_sentence.elementAt(index));
        var double_character = index < text_len - 1 ? simple_character + new String.fromCharCode(unicode_sentence.elementAt(index + 1)) : "";

        if (_vocabulary.keys.contains(double_character)) {
            result += _vocabulary[double_character].toString();
            index += 2;
        } else {
            result += _vocabulary.keys.contains(simple_character) ? _vocabulary[simple_character].toString() : simple_character;
            index += 1;
        }
      }   
    }

    return result;
  }

  String toLanguage({required String sentence}) {
    return this._translate(sentence: sentence, origin: false);
  }

  String fromLanguage({required String sentence}) {
    return this._translate(sentence: sentence, origin: true);
  }
}

void main(List<String> args) {
  Interpreter i = Interpreter(vocabulary: AUREBESH_ALPHABET);
  print(i.toLanguage(sentence: "David"));
  print(i.fromLanguage(sentence: "theshesk herfoskmermesk"));
}
