import 'package:test/test.dart';

import 'main.dart';

void main() {
  test('gets octal & hex', () async {
    final number = 25;
    expect(Utils.getOctal(number: number), "31");
    expect(Utils.getHex(number: number), "19");
  });
  test('gets octal & hex (II)', () async {
    final number = 123123;
    expect(Utils.getOctal(number: number), "360363");
    expect(Utils.getHex(number: number), "1E0F3");
  });
  test('gets octal & hex (III)', () async {
    final number = 9997;
    expect(Utils.getOctal(number: number), "23415");
    expect(Utils.getHex(number: number), "270D");
  });
  test('gets octal & hex (IV)', () async {
    final number = 7;
    expect(Utils.getOctal(number: number), "7");
    expect(Utils.getHex(number: number), "7");
  });
  test('gets octal & hex (V)', () async {
    final number = 15;
    expect(Utils.getOctal(number: number), "17");
    expect(Utils.getHex(number: number), "F");
  });
}
