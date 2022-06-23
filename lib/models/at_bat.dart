import 'package:base_ball_game/constants.dart';
import 'package:base_ball_game/models/pitching_numbers.dart';
import 'package:base_ball_game/models/batting_numbers.dart';
import 'package:base_ball_game/models/inning_result.dart';

class AtBat {
  AtBat(this.pitchingNumbers, this.battingNumbers);

  final PitchingNumbers pitchingNumbers;
  final BattingNumbers battingNumbers;
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

  _isStrike(i) => pitchingNumbers.ofIndex(i) == battingNumbers.ofIndex(i);

  _isBall(i) => pitchingNumbers.hasBall(battingNumbers.ofIndex(i));

  @override
  String toString() {
    return '유저 작성 답: $battingNumbers 결과: $battingResult';
  }
}
