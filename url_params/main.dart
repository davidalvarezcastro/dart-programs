import 'dart:convert';

import 'package:http/http.dart' as http;

class ParamsParser {
  static List<String> getParams({required String url}) {
    if (url.isEmpty) return [];

    List<String> result = [];
    for (var m in RegExp(r'=([a-zA-Z0-9._%-]+)').allMatches(url)) {
      result.add(m[1].toString());
    }

    return result;
  }
}

Future<void> main(List<String> args) async {
  final url = "https://retosdeprogramacion.com?year=2023&challenge=0&languaje=python";
  print(ParamsParser.getParams(url: url));
}
