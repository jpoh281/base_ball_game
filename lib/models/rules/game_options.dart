import 'package:base_ball_game/models/rules/max_innings.dart';
import 'package:base_ball_game/models/rules/number_of_bat.dart';

abstract class GameOption {}

// Set - Set - Set 이기때문에 조금 불편하지만 영어를 준수하여 SetOption 이라고 지었습니다.
class SetOption implements GameOption {
  final MaxInning maxInning;
  final NumberOfBat numberOfBat;

  const SetOption(this.maxInning, this.numberOfBat);
}

class NotSetOption implements GameOption {
  const NotSetOption();
}
