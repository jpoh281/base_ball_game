import 'package:base_ball_game/constants.dart';

class Pitcher {
  Pitcher(this._numbers);

  final List<int> _numbers;

  factory Pitcher.pitchSelection(String? answer) {
    var regExpResult = digitExceptZero.allMatches(answer ?? '');
    if (regExpResult.length != maxBat) {
      throw FormatException('숫자를 $maxBat개만 입력해 주세요.\n');
    }

    var numbers =
        regExpResult.map((e) => int.parse(e.group(0).toString())).toList();
    if (numbers.toSet().length != maxBat) {
      throw FormatException('중복되는 숫자없이 입력해 주세요.\n');
    }

    return Pitcher(numbers);
  }

  int pitch() =>
      _numbers.iterator.current;

  bool canPitch() => _numbers.iterator.moveNext();

  @override
  String toString() {
    return _numbers.join();
  }
}
