import 'package:base_ball_game/models/game.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/parse_result.dart';
import 'package:base_ball_game/views/board.dart';

class Controller {
  Controller(this.game);

  final Game game;
  final Board board = Board();

  start() {
    board.initializeGame();
    InningResult? inningResult;
    do {
      inningResult = ing();
      board.printInningResult(inningResult);
    } while (inningResult is! Win && inningResult is! Lose);
  }

  InningResult ing() {
    var parseResult = _parsing();
    print('loopEND');
    var inningResult = game.checkAnswer(parseResult as Success);
    return inningResult;
  }

  ParseResult _parsing() {
    late ParseResult parseResult;
    do {
      var answer = board.getAnswer();
      parseResult = game.parse(answer);
      board.printParseResult(parseResult);
    } while (parseResult is! Success);

    return parseResult;
  }
}
