import 'package:base_ball_game/models/ball_mix.dart';

class Pitcher {
  final BallMix ballMix;

  const Pitcher(this.ballMix);

  int pitch(int i) => ballMix.ofIndex(i);

  @override
  String toString() {
    return '투수의 볼배합: ${ballMix.toString()}';
  }
}
