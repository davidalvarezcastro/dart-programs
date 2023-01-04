import 'package:test/test.dart';

import 'main.dart';

final Map<String, String> leet_vocabulary = {
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
  'v': '\/',
  'w': '\\/\\/',
  'x': '><',
  'y': 'j',
  'z': '2',
};

final Map<String, String> davalv_vocabulary = {
  'a': '1',
  'b': 'q',
  'c': 'w',
  'd': 'e',
  'e': '2',
  'f': 'a',
  'g': 's',
  'h': 'd',
  'i': '3',
  'j': 'z',
  'k': 'x',
  'l': 'c',
  'm': 'p',
  'n': 'i',
  'o': '4',
  'p': 'u',
  'q': '.,',
  'r': 'j',
  's': '%',
  't': '(',
  'u': '5',
  'v': ')',
  'w': '..',
  'x': '....',
  'y': '......',
  'z': '..',
};

void main() {
  test('encoder vocabulary I', () {
    Encoder e = Encoder(vocabulary: leet_vocabulary);
    expect(e.encode("David"), ")4\/1)");
  });
  test('encoder vocabulary II', () {
    Encoder e = Encoder(vocabulary: davalv_vocabulary);
    expect(e.encode("David"), "e1)3e");
  });
}
