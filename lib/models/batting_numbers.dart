import 'package:base_ball_game/constants.dart';

class BattingNumbers {
  BattingNumbers(this._numbers);

  final List<int> _numbers;

  factory BattingNumbers.fromStdOut(String? answer) {
    var regExpResult = rule.allMatches(answer ?? '');
    if (regExpResult.length != maxBat) {
      throw FormatException('숫자를 세개만 입력해 주세요.\n');
    }

    var numbers =
        regExpResult.map((e) => int.parse(e.group(0).toString())).toList();
    if (numbers.toSet().length != maxBat) {
      throw FormatException('중복되는 숫자없이 입력해 주세요.\n');
    }

    return BattingNumbers(numbers);
  }

  int ofIndex(int i) => _numbers[i];

  @override
  String toString() {
    return _numbers.join();
  }
}
