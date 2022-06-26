import 'package:base_ball_game/models/ball_mix.dart';

class Pitcher {
  const Pitcher(this.ballMix);

  final BallMix ballMix;

  int pitch(int i) => ballMix.ofIndex(i);

  @override
  String toString() {
    return '투수의 볼배합: ${ballMix.toString()}';
  }
}
