import 'package:base_ball_game/models/batter.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/innings.dart';
import 'package:base_ball_game/models/pitcher.dart';
import 'package:base_ball_game/models/inning.dart';
import 'package:base_ball_game/models/mound.dart';

class BaseBall {
  BaseBall();

  // 현재 게임의 정답
  late Batter _batter;
  late Innings _innings;

  bool get isGameOver => _innings.isFull;

  void setGame(Batter batter) {
    _innings.reset();
    _batter = batter;
  }

  InningResult playInning(Pitcher pitcher) {
    var plateAppearance = Mound(_batter, pitcher);

    var inning = Inning(_innings.nowInning, plateAppearance);
    _innings.add(inning);

    return inning.play();
  }

  @override
  String toString() {
    return _innings.toString();
  }
}
