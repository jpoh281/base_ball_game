import 'dart:io';

import 'package:base_ball_game/base_ball_game.dart' as base_ball_game;

void main(List<String> arguments) async {

  stdout.write('*** HDD의 숫자 야구 ***\n');
  stdout.write('시작하려면 아무 키나 입력해 주세요.\n');
  stdin.readLineSync();

  var games = base_ball_game.initializeGame();

  stdout.write('숫자가 결정되었습니다.\n');
  stdout.write('3개의 숫자를 입력해주세요.(ex: 1 2 3, 123)\n');

  var inputText = stdin.readLineSync();
  RegExp regExp = RegExp('[1-9]');

  regExp.hasMatch(inputText ?? '');






}
