import 'package:base_ball_game/models/rule.dart';

class BallMix {
  final List<int> _numbers;

  BallMix(this._numbers);

  factory BallMix.autoGenerate() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    numbers.shuffle();

    List<int> selectedNumbers = [];

    while (selectedNumbers.length < Rule.numberOfBat) {
      selectedNumbers.add(numbers.removeAt(0));
    }

    return BallMix(selectedNumbers);
  }

  factory BallMix.fromUser(String? answer) {
    var regExpResult = Rule.batRegExp.allMatches(answer ?? '');
    if (regExpResult.length != Rule.numberOfBat) {
      throw FormatException('숫자를 ${Rule.numberOfBat}개만 입력해 주세요.\n');
    }

    var numbers =
        regExpResult.map((e) => int.parse(e.group(0).toString())).toList();
    if (numbers.toSet().length != Rule.numberOfBat) {
      throw FormatException('중복되는 숫자없이 입력해 주세요.\n');
    }

    return BallMix(numbers);
  }

  int ofIndex(int i) {
    return _numbers[i];
  }

  bool contains(int number) {
    return _numbers.contains(number);
  }

  @override
  String toString() {
    return _numbers.join(',');
  }
}
