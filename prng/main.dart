
class PRNG {
  final int max;

  PRNG({required this.max});


  int nextInt() {
    return DateTime.now().millisecondsSinceEpoch % (max + 1);
  }
  
}

void main(List<String> args) {
 
  PRNG generator = PRNG(max: 100);
  print(generator.nextInt());
 
}
