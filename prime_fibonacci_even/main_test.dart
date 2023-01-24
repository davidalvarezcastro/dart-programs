import 'package:test/test.dart';

import 'main.dart';

void main() {
  test('suit math I', () {
    SuiteMath sm = SuiteMath();
    const number = 7;

    var result = [sm.isPrime(number), sm.isFibo(number), sm.isEven(number)];

    expect(result, [true, false, false]);
  });

  test('suit math II', () {
    SuiteMath sm = SuiteMath();
    const number = 2;

    var result = [sm.isPrime(number), sm.isFibo(number), sm.isEven(number)];

    expect(result, [true, true, true]);
  });

  test('suit math III', () {
    SuiteMath sm = SuiteMath();
    const number = 33;

    var result = [sm.isPrime(number), sm.isFibo(number), sm.isEven(number)];

    expect(result, [false, false, false]);
  });

  test('suit math IV', () {
    SuiteMath sm = SuiteMath();
    const number = 17;

    var result = [sm.isPrime(number), sm.isFibo(number), sm.isEven(number)];

    expect(result, [true, false, false]);
  });

  test('suit math V', () {
    SuiteMath sm = SuiteMath();
    const number = 24;

    var result = [sm.isPrime(number), sm.isFibo(number), sm.isEven(number)];

    expect(result, [false, false, true]);
  });

  test('suit math VI', () {
    SuiteMath sm = SuiteMath();
    const number = 144;

    var result = [sm.isPrime(number), sm.isFibo(number), sm.isEven(number)];

    expect(result, [false, true, true]);
  });
}
