import 'package:base_ball_game/constants.dart';
import 'package:base_ball_game/models/batting_numbers.dart';

class Inning {
  Inning(this.turn, this.atBat);

  final int turn;
  final BattingNumbers atBat;

  int strikes = 0;
  int balls = 0;

  bool get isOut => strikes == 0 && balls == 0;

  bool get isStrike => strikes != 0 && balls == 0;

  bool get isBall => strikes == 0 && balls != 0;

  bool get isStrikeAndBall => strikes != 0 && balls != 0;

  bool get isWin => strikes == 3;

  playBatting(List<int> answers) {
    for (int i = 0; i < batCount; i++) {
      _check(answers, i);
    }
  }

  void _check(List<int> answers, int i) {
    if (answers[i] == atBat.numbers[i]) {
      strikes++;
      return;
    }
    if (answers.contains(atBat.numbers[i])) {
      balls++;
    }
  }

  @override
  String toString() {
    return '$turn턴 작성 답: $atBat, 결과: $strikes 스트라이크 $balls 볼\n';
  }
}
