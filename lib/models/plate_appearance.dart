import 'package:base_ball_game/constants.dart';
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

    for(int i = 0; i < maxBat; i++){
      judgement(i, ballCount);
    }

    return ballCount;
  }

  void judgement(int index, BallCount ballCount) {
    var pitchingBall = pitcher.pitch(index);
    if (batter.didMissSwing(index, pitchingBall)) {
      ballCount.addStrike();
      return ;
    }

    if (batter.didLook(pitchingBall)) {
      ballCount.addBall();
    }
  }

  @override
  String toString() {
    return '투수: $pitcher, 타자: $batter';
  }
}
