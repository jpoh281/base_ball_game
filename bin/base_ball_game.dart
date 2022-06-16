import 'package:base_ball_game/controllers/controller.dart';
import 'package:base_ball_game/models/game.dart';

void main(List<String> arguments) async {
  Game game = Game();
  Controller controller = Controller(game);

  controller.start();
}
