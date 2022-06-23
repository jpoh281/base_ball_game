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
    for (int i = 0; i < batCount; i++) {
      _swing(i);
    }
    return battingResult;
  }

  void _swing(int i) {
    if (pitching.numbers[i] == batting.numbers[i]) {
      battingResult.addStrike();
      return;
    }
    if (pitching.numbers.contains(batting.numbers[i])) {
      battingResult.addBall();
    }
  }

  @override
  String toString() {
    return '유저 작성 답: ${batting.numbers.join()} 결과: $battingResult';
  }
}
