import 'dart:io';

import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/parse_result.dart';

class Board {
  const Board();

  void initializeGame() {
    stdout.write('*** HDD의 숫자 야구 ***\n');
    stdout.write('시작하려면 아무 키나 입력해 주세요.\n');
    stdin.readLineSync();

    stdout.write('숫자가 설정 되었습니다.\n');
  }

  String? endGame() {
    stdout.write('*** HDD의 숫자 야구 ***\n');
    stdout.write('다시 하려면 y를 입력해 주세요.\n');
    return stdin.readLineSync();

  }

  String? getAnswer() {
    stdout.write('숫자 3개를 입력해주세요.\n');
    stdout.write('0 및 공백, 영문자, 특수문자는 전부 무시됩니다.\n');
    return stdin.readLineSync();
  }

  printInningResult(InningResult inningResult){
    stdout.write(inningResult.toString());
  }

  printParseResult(ParseResult parseResult){
    if(parseResult is Error){
      _error(parseResult);
    }
  }

  _error(Error parseResult){
    stdout.write(parseResult.toString());
  }
}
