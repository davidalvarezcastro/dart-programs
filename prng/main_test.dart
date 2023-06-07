import 'package:test/test.dart';

import 'main.dart';

void main() {
  test('prng get value less than 100', () {
    PRNG generator = PRNG(max: 100);
    expect(generator.nextInt() <= 100, true);
  });
}
