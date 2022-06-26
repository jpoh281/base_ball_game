import 'package:base_ball_game/constants.dart';
import 'package:base_ball_game/models/batter.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/pitcher.dart';
import 'package:base_ball_game/models/inning.dart';
import 'package:base_ball_game/models/plate_appearance.dart';

class BaseBall {
  BaseBall();

  // 현재 게임의 정답
  late Batter _batter;
  List<Inning> _innings = [];

  int get nowInning => _innings.length + 1;

  bool get isGameOver => _innings.length == maxInning;

  void setGame(Batter batter) {
    _innings = [];
    _batter = batter;
  }

  InningResult playInning(Pitcher pitcher) {
    var plateAppearance = PlateAppearance(_batter, pitcher);

    var inning = Inning(nowInning, plateAppearance);
    _innings.add(inning);

    return inning.play();
  }

  @override
  String toString() {
    return _innings.join();
  }
}
