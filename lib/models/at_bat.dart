import 'package:base_ball_game/constants.dart';

class AtBat {
  AtBat(this.numbers);

  final List<int> numbers;

  factory AtBat.fromStdOut(String? answer) {
    var regExpResult = rule.allMatches(answer ?? '');
    if (regExpResult.length != 3) {
      throw FormatException('숫자를 세개만 입력해 주세요.\n');
    }

    var numbers =
        regExpResult.map((e) => int.parse(e.group(0).toString())).toList();
    if (numbers.toSet().length != 3) {
      throw FormatException('중복되는 숫자없이 입력해 주세요.\n');
    }

    return AtBat(numbers);
  }
}
