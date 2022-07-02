import 'package:base_ball_game/models/ball_mix.dart';
import 'package:base_ball_game/models/base_ball.dart';
import 'package:base_ball_game/models/batter.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/now_inning.dart';
import 'package:base_ball_game/models/pitcher.dart';
import 'package:base_ball_game/models/rules/game_options.dart';
import 'package:base_ball_game/views/game_board.dart';

class BaseBallGameController {
  final GameBoard _board;
  final BaseBallGame _baseBallGame;
  final NowInning _nowInning;
  GameOption _gameOption;

  BaseBallGameController(
      this._board, this._baseBallGame, this._gameOption, this._nowInning);

  void initialize() {
    _board.greet();
    _setGameOption();

    late String? result;
    do {
      _nowInning.reset();
      _baseBallGame.setGame(
        Batter(
          BallMix.autoGenerate(_gameOption.numberOfBat,),
        ),
        _gameOption
      );
      _playGame();
      result = _board.askRestart();
    } while (result == 'y');
  }

  _setGameOption() {
    _gameOption = _board.getOptionFromUser();
  }

  void _playGame() {
    late InningResult result;

    do {
      result = _playInning();
      _board.printBattingResult(result);
    } while (!_gameOption.isEnd(result, _nowInning));

    if (_gameOption.isWin(result)) {
      _board.printGameWin();
    }
    if (_gameOption.isLose(_nowInning)) {
      _board.printGameOver();
    }

    _board.printGameResult(_baseBallGame);
  }

  InningResult _playInning() {
    var ballMix = _board.getBallMix(_gameOption.numberOfBat);
    return _baseBallGame.playInning(Pitcher(ballMix));
  }
}
