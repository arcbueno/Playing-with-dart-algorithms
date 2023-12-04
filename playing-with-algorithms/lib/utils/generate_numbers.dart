import 'dart:math';

class NumberGenerator {
  static List<int> generate(int limit) {
    var random = Random();
    final list = <int>[];
    for (var i = 0; list.length != limit; i++) {
      var nextInt = random.nextInt(10);
      if (!list.contains(nextInt)) {
        list.add(nextInt);
      }
    }
    return list;
  }
}
