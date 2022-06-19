import 'package:base_ball_game/models/game.dart';
import 'package:base_ball_game/models/inning.dart';
import 'package:base_ball_game/views/game_board.dart';

class BaseBallGameController {
  BaseBallGameController();

  final GameBoard board = GameBoard();
  final Game game = Game();

  void initialize() {
    board.initializeGame();
    late String? result;
    do {
      game.settingGame();
      _playGame();
      result = board.askRestart();
    } while (result == 'y');
  }

  void _playGame() {
    Inning? inning;
    do {
      inning = _playInning();
      board.printInningResult(inning);
    } while (!game.isGameOver && !inning.isWin);

    if (game.isGameOver) {
      board.printGameOver();
    }
    board.printGameResult(game.innings);
  }

  Inning _playInning() {
    var answer = board.getAnswer();
    var inning = Inning(answer);
    game.playInning(inning);
    return inning;
  }
}
