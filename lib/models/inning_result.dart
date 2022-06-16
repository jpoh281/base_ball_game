abstract class InningResult {
  factory InningResult.parse(int strikes, int balls) {

    if(strikes == 3){
      return Win();
    }

    if (strikes != 0 && balls == 0) {
      return Strike(strikes: strikes);
    }

    if (strikes == 0 && balls != 0) {
      return Ball(balls: balls);
    }

    if (strikes != 0 && balls != 0) {
      return StrikeAndBall(strikes: strikes, balls: balls);
    }

    return Out();
  }
}

class Win implements InningResult {
  @override
  String toString() {
    return '승리하셨습니다.\n';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Win && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class Strike implements InningResult {
  Strike({required this.strikes});

  final int strikes;

  @override
  String toString() {
    return '$strikes 스크라이크\n';
  }
}

class Ball implements InningResult {
  Ball({required this.balls});

  final int balls;

  @override
  String toString() {
    return '$balls 볼\n';
  }
}

class StrikeAndBall implements InningResult {
  StrikeAndBall({required this.strikes, required this.balls});

  final int strikes;
  final int balls;

  @override
  String toString() {
    return '$balls 볼, $strikes 스트라이크\n';
  }
}

class Out implements InningResult {
  @override
  String toString() {
    return '아웃\n';
  }
}

class Lose implements InningResult {
  Lose();

  @override
  String toString() {
    return '패배하셨습니다.\n';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Lose && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
