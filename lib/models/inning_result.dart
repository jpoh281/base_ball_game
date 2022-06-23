import 'package:base_ball_game/constants.dart';

class InningResult {
  InningResult();

  int _strikes = 0;
  int _balls = 0;

  bool get isOut => _strikes == 0 && _balls == 0;

  bool get isStrike => _strikes != 0 && _balls == 0;

  bool get isBall => _strikes == 0 && _balls != 0;

  bool get isStrikeAndBall => _strikes != 0 && _balls != 0;

  bool get isWin => _strikes == maxBat;

  addStrike(){
    _strikes++;
  }

  addBall(){
    _balls++;
  }

  @override
  String toString() {
    if (isBall) {
      return '$_balls 볼\n';
    }

    if (isStrike) {
      return '$_strikes 스트라이크\n';
    }

    if (isStrikeAndBall) {
      return '$_strikes 스트라이크 $_balls 볼\n';
    }

    return '아웃\n';
  }
}
