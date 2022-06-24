import 'package:base_ball_game/constants.dart';
import 'package:base_ball_game/models/pitching_numbers.dart';
import 'package:base_ball_game/models/batting_numbers.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/inning.dart';

class BaseBall {
  BaseBall();

  // 현재 게임의 정답
  late PitchingNumbers _pitchingNumbers;
  List<Inning> _innings = [];

  int get nowInning => _innings.length + 1;

  bool get isGameOver => _innings.length == maxInning;

  void setGame() {
    _innings = [];
    _pitchingNumbers = PitchingNumbers.setNumbers();
  }

  InningResult playInning(BattingNumbers battingNumbers) {
    var inning = Inning(nowInning);
    _innings.add(inning);
    return inning.play(_pitchingNumbers, battingNumbers);
  }

  @override
  String toString() {
    return _innings.join();
  }
}
