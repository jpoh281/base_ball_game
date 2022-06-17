import 'package:base_ball_game/models/game.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/views/game_board.dart';

class BaseBallGameController {
  BaseBallGameController();

  final GameBoard board = GameBoard();
  final Game game = Game();

  void play() {
    board.initializeGame();
    late String? result;
    do {
      game.settingGame();
      _doingGame();
      result = board.askRestart();
    } while (result == 'y');
  }

  void _doingGame() {
    InningResult? inningResult;
    do {
      inningResult = _playInning();
      board.printInningResult(inningResult);
    } while (inningResult is! Win && inningResult is! Lose);
  }

  InningResult _playInning() {
    var answer = board.getAnswer();
    var inningResult = game.checkAnswer(answer);
    return inningResult;
  }
}
