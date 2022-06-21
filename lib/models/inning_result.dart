class InningResult {
  InningResult();

  int strikes = 0;
  int balls = 0;

  bool get isOut => strikes == 0 && balls == 0;

  bool get isStrike => strikes != 0 && balls == 0;

  bool get isBall => strikes == 0 && balls != 0;

  bool get isStrikeAndBall => strikes != 0 && balls != 0;

  bool get isWin => strikes == 3;

  @override
  String toString() {
    if (isBall) {
      return '$balls 볼\n';
    }

    if (isStrike) {
      return '$strikes 스트라이크\n';
    }

    if (isStrikeAndBall) {
      return '$strikes 스트라이크 $balls 볼\n';
    }

    return '아웃\n';
  }
}
