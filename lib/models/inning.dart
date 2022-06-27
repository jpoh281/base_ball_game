import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/mound.dart';


class Inning {
  Inning(this._turn, this._mound);

  final int _turn;
  final Mound _mound;
  late final InningResult _inningResult;

  InningResult play() {
    var ballCount = _mound.compete();
    _inningResult = ballCount.toResult();
    return _inningResult;
  }

  @override
  String toString() {
    return '${_turn.toString().padLeft(2,'0')}이닝 $_mound 결과 $_inningResult';
  }
}
