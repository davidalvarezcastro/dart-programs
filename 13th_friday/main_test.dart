import 'package:test/test.dart';

import 'main.dart';

void main() {
  test('2023/01 returns true', () async {
    expect(Utils.isThere13thFriday(month: 1, year: 2023), true);
  });
  test('2023/03 returns false', () async {
    expect(Utils.isThere13thFriday(month: 3, year: 2023), false);
  });
  test('1972/10 returns true', () async {
    expect(Utils.isThere13thFriday(month: 10, year: 1972), true);
  });
}
