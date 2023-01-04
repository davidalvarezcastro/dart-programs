/// Returns if [num1] is multiple of [num2]
bool isMultiple(num num1, num num2) {
  return num1 % num2 == 0;
}

/// Generates app domain from 1 to [end]
List<int> getDomain(int end) {
  return List<int>.generate(end, (index) => index + 1);
}

void main(List<String> arguments) {
  for (var val in getDomain(100)) {
    String result = '';

    bool isMultipleOf3 = isMultiple(val, 3);
    bool isMultipleOf5 = isMultiple(val, 5);

    if (isMultipleOf3 || isMultipleOf5) {
      if (isMultipleOf3) {
        result = 'fizz';
      }

      if (isMultipleOf5) {
        result += 'buzz';
      }
    } else {
      result = '${val}';
    }

    print('${result}');
  }
}
