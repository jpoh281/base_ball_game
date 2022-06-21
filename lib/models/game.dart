import 'package:base_ball_game/constants.dart';
import 'package:base_ball_game/models/answer_numbers.dart';
import 'package:base_ball_game/models/batting_numbers.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/inning.dart';

class BaseBall {
  BaseBall();

  // 현재 게임의 정답
  late AnswerNumbers answerNumbers;
  List<Inning> innings = [];

  int get nowTurn => innings.length + 1;

  bool get isGameOver => innings.length == maxTurn;

  void setGame() {
    innings = [];
    answerNumbers = AnswerNumbers.setNumbers();
  }

  InningResult playInning(BattingNumbers battingNumbers) {
    var inning = Inning(innings.length + 1);
    innings.add(inning);
    return inning.play(answerNumbers, battingNumbers);
  }

  @override
  String toString() {
    return innings.join();
  }
}
