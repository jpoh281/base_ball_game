import 'package:base_ball_game/constants.dart';
import 'package:base_ball_game/models/pitching_numbers.dart';
import 'package:base_ball_game/models/batting_numbers.dart';
import 'package:base_ball_game/models/inning_result.dart';

class AtBat {
  AtBat(this.pitching, this.batting);

  final PitchingNumbers pitching;
  final BattingNumbers batting;
  final InningResult battingResult = InningResult();

  InningResult play() {
    for (int i = 0; i < maxBat; i++) {
      _swing(i);
    }
    return battingResult;
  }

  void _swing(int i) {
    if (_isStrike(i)) {
      battingResult.addStrike();
      return;
    }
    if (_isBall(i)) {
      battingResult.addBall();
    }
  }

  _isStrike(i) => pitching.numbers[i] == batting.numbers[i];

  _isBall(i) => pitching.numbers.contains(batting.numbers[i]);

  @override
  String toString() {
    return '유저 작성 답: ${batting.numbers.join()} 결과: $battingResult';
  }
}
