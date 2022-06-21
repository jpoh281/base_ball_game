import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/base_ball.dart';
import 'package:base_ball_game/views/game_board.dart';

class BaseBallGameController {
  BaseBallGameController();

  final GameBoard board = GameBoard();
  final BaseBall game = BaseBall();

  void initialize() {
    board.initializeGame();
    late String? result;
    do {
      game.setGame();
      _playGame();
      result = board.askRestart();
    } while (result == 'y');
  }

  void _playGame() {
    InningResult? result;
    do {
      result = _playInning();
      board.printBattingResult(result);
    } while (!game.isGameOver && !result.isWin);
    if(result.isWin){
      board.printGameWin();
    }
    if (game.isGameOver) {
      board.printGameOver();
    }

    board.printGameResult(game);
  }

  InningResult _playInning() {
    var atBat = board.getAnswer();
    return game.playInning(atBat);
  }
}
