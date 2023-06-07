
import 'dart:convert';

class Utils {
  static Map<int, int> _charCounter({required String word}) {
    Map<int, int> result = {};
    word = word.replaceAll(" ", "");
    String? wordMatched = RegExp(r'^[A-Za-z]+$').firstMatch(word)?.group(0);

    if (!wordMatched!.isEmpty) {
      for (var c in utf8.encode(wordMatched)) {
        if (!result.containsKey(c)) result[c] = 0;
        result[c] = result[c]! + 1;
      }

      return result;
    }

    return {};
  }

  static bool isHeterogram({required String word}) {
    for (var c in Utils._charCounter(word: word).values) {
      if (c > 1) return false;
    }
    return true;
  }

  static bool isIsogram({required String word}) {
    var order = 0;
    for (var c in Utils._charCounter(word: word).values) {
      if (order == 0) {
        order = c;
      }

      if (order != c) {
        return false;
      }

    }
    return true;
  }

  static bool isPangram({required String word}) {
    return Utils._charCounter(word: word).keys.length == 27;
  }
  
}

void main(List<String> args) {
  print(Utils.isHeterogram(word: "maei"));
  print(Utils.isIsogram(word: "mama"));
  print(Utils.isPangram(word: "The quick brown fox jumps over the lazy dog"));
}
