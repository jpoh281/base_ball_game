import 'package:base_ball_game/controllers/base_ball_game_controller.dart';
import 'package:base_ball_game/models/base_ball.dart';
import 'package:base_ball_game/models/now_inning.dart';
import 'package:base_ball_game/models/rules/game_options.dart';
import 'package:base_ball_game/views/game_board.dart';
import 'package:base_ball_game/views/input_parser.dart';

void main(List<String> arguments) async {

  var nowInning = NowInning();

  BaseBallGameController controller = BaseBallGameController(
    GameBoard(
      InputParser(),
    ),
    BaseBallGame(
      nowInning,
    ),
    NotSetOption(),
    nowInning,
  );

  controller.initialize();
}
