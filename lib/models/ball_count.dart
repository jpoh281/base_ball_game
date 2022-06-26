import 'package:base_ball_game/models/inning_result.dart';

class BallCount {
  BallCount();

  int _strikes = 0;
  int _balls = 0;

  void addStrike() {
    _strikes++;
  }

  void addBall() {
    _balls++;
  }

  InningResult toResult() => InningResult(_strikes, _balls);
}
