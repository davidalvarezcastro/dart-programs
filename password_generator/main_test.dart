import 'package:test/test.dart';

import 'main.dart';

void main() {
  test('password with letters (lowercase)', () {
    RegExp exp = RegExp(r'([a-z]+)');
    var generator = PasswordGenerator(maxNum: MAX_LENGTH, minNum: MIN_LENGTH);

    var pwd = generator.generate(
        size: 8, capitalize: false, symbols: false, numbers: false);

    expect(pwd.length, 8);
    expect(exp.allMatches(pwd).length == 1, true);
  });

  test('password with letters (uppercase)', () {
    RegExp exp = RegExp(r'([a-zA-Z]+)');
    var generator = PasswordGenerator(maxNum: MAX_LENGTH, minNum: MIN_LENGTH);

    var pwd = generator.generate(
        size: 13, capitalize: true, symbols: false, numbers: false);

    expect(pwd.length, 13);
    expect(exp.allMatches(pwd).length == 1, true);
  });

  test('password with letters (uppercase - numbers)', () {
    RegExp exp = RegExp(r'([a-zA-Z0-9]+)');
    var generator = PasswordGenerator(maxNum: MAX_LENGTH, minNum: MIN_LENGTH);

    var pwd = generator.generate(
        size: 24, capitalize: true, symbols: false, numbers: true);

    expect(pwd.length, MAX_LENGTH);
    expect(exp.allMatches(pwd).length == 1, true);
  });

  test('password with letters (uppercase - numbers - symbols)', () {
    RegExp exp = RegExp(r'(\w+)');
    var generator = PasswordGenerator(maxNum: MAX_LENGTH, minNum: MIN_LENGTH);

    var pwd = generator.generate(
        size: 2, capitalize: true, symbols: false, numbers: true);

    expect(pwd.length, MIN_LENGTH);
    expect(exp.allMatches(pwd).length == 1, true);
  });
}
