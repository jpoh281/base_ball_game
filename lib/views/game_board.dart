import 'dart:io';
import 'package:base_ball_game/constants.dart';
import 'package:base_ball_game/models/ball_mix.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/pitcher.dart';
import 'package:base_ball_game/models/base_ball.dart';

class GameBoard {
  const GameBoard();

  void initializeGame() {
    stdout.write('*** HDD의 숫자 야구 ***\n');
  }

  String? getMaxInngings(){
    stdout.write('최대 이닝을 입력해주세요.\n');
  }

  String? askRestart() {
    stdout.write('다시 하려면 y를 입력해 주세요.\n');
    return stdin.readLineSync();
  }

  BallMix selectBallMix() {
    BallMix? ballMix;
    do {
      stdout.write('숫자 $maxBat개를 입력해주세요.\n');
      stdout.write('0 및 공백, 영문자, 특수문자는 전부 무시됩니다.\n');
      var answer = stdin.readLineSync();
      try {
        ballMix = BallMix.pitcher(answer);
      } on FormatException catch (e) {
        stdout.write(e.message);
      }
    } while (ballMix == null);
    return ballMix;
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

  printGameResult(BaseBall game) {
    stdout.write(game);
  }
}
