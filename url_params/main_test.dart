import 'package:test/test.dart';

import 'main.dart';

void main() {
  test('gets params', () async {
    final url = "https://retosdeprogramacion.com?year=2023&challenge=0&languaje=dart&developer=asda";
    expect(ParamsParser.getParams(url: url), ["2023", "0", "dart", "asda"]);
  });
}
