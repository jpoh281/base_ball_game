class InningResult {
  final int strikes;
  final int _balls;

  InningResult(this.strikes, this._balls);

  bool get isOut => strikes == 0 && _balls == 0;

  bool get isStrike => strikes != 0 && _balls == 0;

  bool get isBall => strikes == 0 && _balls != 0;

  bool get isStrikeAndBall => strikes != 0 && _balls != 0;

  @override
  String toString() {
    if (isBall) {
      return '$_balls 볼\n';
    }

    if (isStrike) {
      return '$strikes 스트라이크\n';
    }

    if (isStrikeAndBall) {
      return '$strikes 스트라이크 $_balls 볼\n';
    }

    return '아웃\n';
  }
}