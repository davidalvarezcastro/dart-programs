
final HEX_VALUES = "0123456789ABCDEF";

class Utils {
  static String getOctal({required int number}) {
    var octal = "";
    var current_decimal = number;

    while (current_decimal > 0) {
      octal = (current_decimal % 8).toString() + octal;
      current_decimal = (current_decimal ~/ 8);
    }

    return octal.isEmpty ? "0" : octal;
  }
  static String getHex({required int number}) {
    var hex = "";
    var current_decimal = number;

    while (current_decimal > 0) {
      hex = HEX_VALUES[(current_decimal % 16)] + hex;
      current_decimal = (current_decimal ~/ 16);
    }

    return hex.isEmpty ? "0" : hex;
  }
}

Future<void> main(List<String> args) async {
  final number = 25;
  print(Utils.getOctal(number: number));
  print(Utils.getHex(number: number));
}
