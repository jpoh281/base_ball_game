import 'package:base_ball_game/models/batter.dart';
import 'package:base_ball_game/models/pitcher.dart';
import 'package:base_ball_game/models/ball_count.dart';

/// 타석
class Mound {
  final Batter batter;
  final Pitcher pitcher;
  final int numberOfBat;
  Mound(this.batter, this.pitcher, this.numberOfBat);

  BallCount compete() {
    final BallCount ballCount = BallCount();

    for (int i = 0; i < numberOfBat; i++) {
      judge(i, ballCount);
    }

    return ballCount;
  }

  void judge(int index, BallCount ballCount) {
    var pitchingBall = pitcher.pitch(index);
    if (batter.didMissSwing(index, pitchingBall)) {
      ballCount.addStrike();
      return;
    }

    if (batter.didLook(pitchingBall)) {
      ballCount.addBall();
    }
  }

  @override
  String toString() {
    return '$pitcher $batter';
  }
}
