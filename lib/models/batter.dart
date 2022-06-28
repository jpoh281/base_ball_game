import 'package:base_ball_game/models/ball_mix.dart';

class Batter {

  const Batter(this.weakness);

  final BallMix weakness;

  bool didMissSwing(int index, int pitchingBall) =>
      weakness.ofIndex(index) == pitchingBall;

  bool didLook(int pitchingBall) => weakness.contains(pitchingBall);

  @override
  String toString() {
    return '타자의 약점: ${weakness.toString()}';
  }
}
