import 'dart:io';
import 'package:base_ball_game/models/at_bat.dart';
import 'package:base_ball_game/models/inning.dart';

class GameBoard {
  const GameBoard();

  void initializeGame() {
    stdout.write('*** HDD의 숫자 야구 ***\n');
    stdout.write('시작하려면 아무 키나 입력해 주세요.\n');
    stdin.readLineSync();

    stdout.write('숫자가 설정 되었습니다.\n');
  }

  String? askRestart() {
    stdout.write('다시 하려면 y를 입력해 주세요.\n');
    return stdin.readLineSync();
  }

  AtBat getAnswer() {
    AtBat? atBat;
    do {
      stdout.write('숫자 3개를 입력해주세요.\n');
      stdout.write('0 및 공백, 영문자, 특수문자는 전부 무시됩니다.\n');
      var answer = stdin.readLineSync();
      try {
        atBat = AtBat.fromStdOut(answer);
      } on FormatException catch (e) {
        stdout.write(e.message);
      }
    } while (atBat == null);
    return atBat;
  }

  void printGameOver() {
    stdout.write('게임에 패배하셨습니다.\n');
  }

  void printInningResult(Inning inning) {
    if (inning.isWin) {
      stdout.write('게임에 승리하셨습니다.\n');
      return;
    }

    if (inning.isBall) {
      stdout.write('${inning.balls} 볼\n');
      return;
    }

    if (inning.isStrike) {
      stdout.write('${inning.strikes} 스트라이크\n');
      return;
    }

    if (inning.isStrikeAndBall) {
      stdout.write('${inning.strikes} 스트라이크 ${inning.balls} 볼\n');
      return;
    }

    stdout.write('아웃\n');
  }

  printGameResult(List<Inning> innings) {
    stdout.write('$innings');
  }
}
