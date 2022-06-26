import 'package:base_ball_game/controllers/base_ball_game_controller.dart';
import 'package:base_ball_game/models/base_ball.dart';
import 'package:base_ball_game/views/game_board.dart';

void main(List<String> arguments) async {
  BaseBallGameController controller =
      BaseBallGameController(GameBoard(), BaseBall());
  controller.initialize();
}
