import 'package:base_ball_game/models/batter.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/mound.dart';
import 'package:base_ball_game/models/pitcher.dart';
import 'package:base_ball_game/models/ball_count.dart';

class Inning {
  Inning(this._turn, this.plateAppearance);

  final int _turn;
  final Mound plateAppearance;
  late final InningResult _inningResult;

  InningResult play() {
    var ballCount = plateAppearance.compete();
    _inningResult = ballCount.toResult();
    return _inningResult;
  }

  @override
  String toString() {
    return '${_turn.toString().padLeft(2,'0')}이닝 $plateAppearance 결과 $_inningResult';
  }
}
