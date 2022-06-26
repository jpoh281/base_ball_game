import 'package:base_ball_game/models/ball_count.dart';
import 'package:base_ball_game/models/ball_mix.dart';
import 'package:base_ball_game/models/base_ball.dart';
import 'package:base_ball_game/models/batter.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/pitcher.dart';
import 'package:base_ball_game/views/game_board.dart';

class BaseBallGameController {
  BaseBallGameController(this.board, this.game);

  final GameBoard board;
  final BaseBall game;

  void initialize() {
    board.initializeGame();
    late String? result;
    do {
      game.setGame(
        Batter(
          BallMix.battersWeakness(),
        ),
      );
      _playGame();
      result = board.askRestart();
    } while (result == 'y');
  }

  void _playGame() {
    late InningResult result;
    do {
      result = _playInning();
      board.printBattingResult(result);
    } while (!game.isGameOver && !result.isWin);
    if (result.isWin) {
      board.printGameWin();
    }
    if (game.isGameOver) {
      board.printGameOver();
    }

    board.printGameResult(game);
  }

  InningResult _playInning() {
    var ballMix = board.selectBallMix();
    return game.playInning(Pitcher(ballMix));
  }
}
