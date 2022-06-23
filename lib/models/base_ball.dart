import 'package:base_ball_game/constants.dart';
import 'package:base_ball_game/models/pitching_numbers.dart';
import 'package:base_ball_game/models/batting_numbers.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/inning.dart';

class BaseBall {
  BaseBall();

  // 현재 게임의 정답
  late PitchingNumbers pitchingNumbers;
  List<Inning> innings = [];

  int get nowInning => innings.length + 1;

  bool get isGameOver => innings.length == maxInning;

  void setGame() {
    innings = [];
    pitchingNumbers = PitchingNumbers.setNumbers();
  }

  InningResult playInning(BattingNumbers battingNumbers) {
    var inning = Inning(nowInning);
    innings.add(inning);
    return inning.play(pitchingNumbers, battingNumbers);
  }

  @override
  String toString() {
    return innings.join();
  }
}
