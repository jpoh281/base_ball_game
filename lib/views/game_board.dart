import 'dart:io';
import 'package:base_ball_game/models/ball_mix.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/base_ball.dart';
import 'package:base_ball_game/models/rules/game_options.dart';
import 'package:base_ball_game/models/rules/max_innings.dart';
import 'package:base_ball_game/models/rules/number_of_bat.dart';
import 'package:base_ball_game/views/input_parser.dart';

class GameBoard {
  final InputParser inputParser;

  const GameBoard(this.inputParser);

  void greet() {
    stdout.write('*** HDD의 숫자 야구 ***\n');
  }

  GameOption getOptionFromUser() {
    return SetOption(
      _getNumberOfBat(),
      _getMaxInnings(),
    );
  }

  MaxInning _getMaxInnings() {
    stdout.write('최대 이닝을 입력해주세요.\n');
    int? maxInning;

    do {
      try {
        maxInning = inputParser.parseToMaxInning(stdin.readLineSync());
      } on FormatException catch (e) {
        stdout.write(e.message);
      }
    } while (maxInning == null);

    return MaxInning(maxInning);
  }

  NumberOfBat _getNumberOfBat() {
    stdout.write('몇자리의 숫자로 게임을 진행할지 입력해주세요.\n');
    int? numberOfBat;

    do {
      try {
        numberOfBat = inputParser.parseToNumberOfBat(stdin.readLineSync());
      } on FormatException catch (e) {
        stdout.write(e.message);
      }
    } while (numberOfBat == null);

    return NumberOfBat(numberOfBat);
  }

  String? askRestart() {
    stdout.write('다시 하려면 y를 입력해 주세요.\n');
    return stdin.readLineSync();
  }

  BallMix getBallMix(int numberOfBat) {
    BallMix? pitchersBallMix;
    do {
      stdout.write('숫자 $numberOfBat개를 입력해주세요.\n');
      stdout.write('0 및 공백, 영문자, 특수문자는 전부 무시됩니다.\n');
      try {
        pitchersBallMix = BallMix(
            inputParser.parseToIntList(stdin.readLineSync(), numberOfBat));
      } on FormatException catch (e) {
        stdout.write(e.message);
      }
    } while (pitchersBallMix == null);
    return pitchersBallMix;
  }

  void printGameOver() {
    stdout.write('게임에 패배하셨습니다.\n');
  }

  void printGameWin() {
    stdout.write('게임에 승리하셨습니다.\n');
  }

  void printBattingResult(InningResult result) {
    stdout.write(result);
  }

  printGameResult(BaseBallGame game) {
    stdout.write(game);
  }
}
