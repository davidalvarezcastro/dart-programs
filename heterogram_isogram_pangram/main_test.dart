import 'package:test/test.dart';

import 'main.dart';

void main() {
  test('heterogram true', () {
    expect(Utils.isHeterogram(word: "maei"), true);
  });
  test('heterogram true (II)', () {
    expect(Utils.isHeterogram(word: "a"), true);
  });
  test('heterogram true (III)', () {
    expect(Utils.isHeterogram(word: "aeiou"), true);
  });
  test('heterogram false', () {
    expect(Utils.isHeterogram(word: "mama"), false);
  });
  test('heterogram false (II)', () {
    expect(Utils.isHeterogram(word: "aa"), false);
  });
  test('isIsogram true', () {
    expect(Utils.isIsogram(word: "mama pepe"), true);
  });
  test('isPangram false', () {
    expect(Utils.isIsogram(word: "mama papa"), false);
  });
  test('isPangram true', () {
    expect(Utils.isPangram(word: "The quick brown fox jumps over the lazy dog"), true);
  });
  test('isPangram false', () {
    expect(Utils.isPangram(word: "a"), false);
  });
}
