import 'package:test/test.dart';

import 'main.dart';

void main() {
  test('translate from english to aurebesh', () async {
    Interpreter i = Interpreter(vocabulary: AUREBESH_ALPHABET);
    expect(i.toLanguage(sentence: "David"), "dornaurekveviskdorn");
  });
  test('translate from english to aurebesh (II)', () async {
    Interpreter i = Interpreter(vocabulary: AUREBESH_ALPHABET);
    expect(i.toLanguage(sentence: "venga"), "vevesknenaurek");
  });
  test('translate from english to aurebesh (III)', () async {
    Interpreter i = Interpreter(vocabulary: AUREBESH_ALPHABET);
    expect(i.toLanguage(sentence: "shuu"), "senuskusk");
  });
  test('translate from aurebesh to english', () async {
    Interpreter i = Interpreter(vocabulary: AUREBESH_ALPHABET);
    expect(i.fromLanguage(sentence: "vevaureklethesk"), "vale");
  });
  test('translate from aurebesh to english (II)', () async {
    Interpreter i = Interpreter(vocabulary: AUREBESH_ALPHABET);
    expect(i.fromLanguage(sentence: "pethenthlethlethaurek"), "paella");
  });
  test('translate from aurebesh to english (III)', () async {
    Interpreter i = Interpreter(vocabulary: AUREBESH_ALPHABET);
    expect(i.fromLanguage(sentence: "theshesk herfoskmermesk"), "the home");
  });
}
