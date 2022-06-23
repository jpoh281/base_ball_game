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

  _isStrike(i) => pitching.ofIndex(i) == batting.ofIndex(i);

  _isBall(i) => pitching.hasBall(batting.ofIndex(i));

  @override
  String toString() {
    return '유저 작성 답: $batting 결과: $battingResult';
  }
}
