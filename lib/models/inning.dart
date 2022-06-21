import 'package:base_ball_game/models/pitching_numbers.dart';
import 'package:base_ball_game/models/at_bat.dart';
import 'package:base_ball_game/models/batting_numbers.dart';
import 'package:base_ball_game/models/inning_result.dart';

class Inning {
  Inning(this.turn);

  final int turn;
  late final AtBat atBat;

  InningResult play(PitchingNumbers pitchingNumbers, BattingNumbers battingNumbers) {
    atBat = AtBat(pitchingNumbers, battingNumbers);
    return atBat.play();
  }
  

  @override
  String toString() {
    return '$turn턴 $atBat';
  }
}
