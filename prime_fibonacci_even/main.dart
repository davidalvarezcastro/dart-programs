import 'dart:math';

class SuiteMath {
  SuiteMath();

  bool _isPerfectSquare(int number) {
    if (number >= 0) {
      var sqr = sqrt(number).toInt();

      return (sqr * sqr) == number;
    }
    return false;
  }

  bool isPrime(int number) {
    for (var i = 2; i < number; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  bool isFibo(int number) {
    return _isPerfectSquare(5 * pow(number, 2).toInt() + 4) ||
        _isPerfectSquare(5 * pow(number, 2).toInt() - 4);
  }

  bool isEven(int number) {
    return number % 2 == 0;
  }
}

void main(List<String> args) {
  SuiteMath sm = SuiteMath();
  const number = 144;

  print([sm.isPrime(number), sm.isFibo(number), sm.isEven(number)]);
}
