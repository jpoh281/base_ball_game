import 'package:base_ball_game/constants.dart';

class Inning {
  Inning(this.atBat);

  final List<int> atBat;

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
    if (answers[i] == atBat[i]) {
      strikes++;
      return;
    }
    if (answers.contains(atBat[i])) {
      balls++;
    }
  }
}