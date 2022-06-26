import 'package:base_ball_game/models/batter.dart';
import 'package:base_ball_game/models/pitcher.dart';
import 'package:base_ball_game/models/ball_count.dart';

/// 타석
class PlateAppearance {
  PlateAppearance(this.batter, this.pitcher);

  final Batter batter;
  final Pitcher pitcher;

  BallCount compete() {
    final BallCount ballCount = BallCount();
    while (batter.hasBallCount() && pitcher.canPitch()) {
      judgement(ballCount);
    }

    return ballCount;
  }

  void judgement(BallCount ballCount) {
    var pitchingBall = pitcher.pitch();
    if (batter.didMissSwing(pitchingBall)) {
      ballCount.addStrike();
    }

    if (batter.didLook(pitchingBall)) {
      ballCount.addBall();
    }
  }
}
