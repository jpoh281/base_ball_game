import 'package:base_ball_game/constants.dart';
import 'package:base_ball_game/models/pitching_numbers.dart';
import 'package:base_ball_game/models/batting_numbers.dart';
import 'package:base_ball_game/models/inning_result.dart';

class AtBat {
  AtBat(this.answer, this.batting);

  final PitchingNumbers answer;
  final BattingNumbers batting;
  final InningResult battingResult = InningResult();

  InningResult play() {
    for (int i = 0; i < batCount; i++) {
      _swing(i);
    }
    return battingResult;
  }

  void _swing(int i) {
    if (answer.numbers[i] == batting.numbers[i]) {
      battingResult.strikes++;
      return;
    }
    if (answer.numbers.contains(batting.numbers[i])) {
      battingResult.balls++;
    }
  }

  @override
  String toString() {
    return '유저 작성 답: ${batting.numbers.join()} 결과: $battingResult';
  }
}
