import 'dart:convert';

import 'package:http/http.dart' as http;

class Utils {
  static bool isThere13thFriday({required int month, required int year}) {
    return DateTime.utc(year, month, 13).weekday == 5;
  }
}

void main(List<String> args) {
  print(Utils.isThere13thFriday(month: 1, year: 2023));
}
