import 'package:base_ball_game/models/batter.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/innings.dart';
import 'package:base_ball_game/models/now_inning.dart';
import 'package:base_ball_game/models/pitcher.dart';
import 'package:base_ball_game/models/inning.dart';
import 'package:base_ball_game/models/mound.dart';
import 'package:base_ball_game/models/rules/game_options.dart';

class BaseBallGame {
  BaseBallGame(this.nowInning);

  final NowInning nowInning;

  late GameOption _gameOption;
  late Batter _batter;
  late Innings _innings;

  void setGame(Batter batter, GameOption gameOption, [Innings? innings]) {
    _batter = batter;
    _gameOption = gameOption;
    _innings = innings ?? Innings();
    nowInning.reset();
  }

  InningResult playInning(Pitcher pitcher) {
    var plateAppearance = Mound(_batter, pitcher, _gameOption.numberOfBat);

    var inning = Inning(nowInning.value, plateAppearance);
    _innings.add(inning);

    return inning.play();
  }

  @override
  String toString() {
    return _innings.toString();
  }
}
