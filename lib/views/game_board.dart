import 'dart:io';
import 'package:base_ball_game/constants.dart';
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

  List<int> getAnswer() {
    late List<int> numbers;
    do {
      stdout.write('숫자 3개를 입력해주세요.\n');
      stdout.write('0 및 공백, 영문자, 특수문자는 전부 무시됩니다.\n');
      numbers = _parseAnswer(stdin.readLineSync());
    } while (numbers.length != 3);
    return numbers;
  }

  List<int> _parseAnswer(String? answer) {
    var regResult = rule.allMatches(answer ?? '');
    if (regResult.length != 3) {
      stdout.write("숫자를 세개만 입력해 주세요.\n");
      return [];
    }
    var numbers =
        regResult.map((e) => int.parse(e.group(0).toString())).toList();
    if (numbers.toSet().length != 3) {
      stdout.write("중복되는 숫자 없이 입력해 주세요.\n");
      return [];
    }
    return numbers;
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
}
