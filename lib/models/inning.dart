import 'package:base_ball_game/models/answer_numbers.dart';
import 'package:base_ball_game/models/at_bat.dart';
import 'package:base_ball_game/models/batting_numbers.dart';
import 'package:base_ball_game/models/inning_result.dart';

class Inning {
  Inning(this.turn);

  final int turn;
  late final AtBat atBat;

  InningResult play(AnswerNumbers answerNumbers, BattingNumbers battingNumbers) {
    atBat = AtBat(answerNumbers, battingNumbers);
    var result = atBat.play();
    return result;
  }
  

  @override
  String toString() {
    return '$turn턴 $atBat';
  }
}
