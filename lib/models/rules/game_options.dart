import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/now_inning.dart';
import 'package:base_ball_game/models/rules/max_innings.dart';
import 'package:base_ball_game/models/rules/number_of_bat.dart';

abstract class GameOption {
  int get numberOfBat;

  int get maxInning;

  bool isEnd(InningResult inningResult, NowInning nowInning);

  bool isLose(NowInning nowInning);

  bool isWin(InningResult inningResult);
}

// Set - Set - Set 이기때문에 조금 불편하지만 영어를 준수하여 SetOption 이라고 지었습니다.
class SetOption implements GameOption {
  final NumberOfBat _numberOfBat;
  final MaxInning _maxInning;

  const SetOption(this._numberOfBat, this._maxInning);

  @override
  int get numberOfBat => _numberOfBat.value;

  @override
  int get maxInning => _maxInning.value;

  @override
  bool isEnd(InningResult inningResult, NowInning nowInning) =>
      isWin(inningResult) || isLose(nowInning);

  @override
  bool isWin(InningResult inningResult) => inningResult.strikes == numberOfBat;

  @override
  bool isLose(NowInning nowInning) => nowInning.value == maxInning;
}

class NotSetOption implements GameOption {
  const NotSetOption();

  @override
  int get numberOfBat => throw UnimplementedError();

  @override
  int get maxInning => throw UnimplementedError();

  @override
  bool isEnd(InningResult inningResult, NowInning nowInning) =>
      throw UnimplementedError();

  @override
  bool isWin(InningResult inningResult) => throw UnimplementedError();

  @override
  bool isLose(NowInning nowInning) => throw UnimplementedError();
}
