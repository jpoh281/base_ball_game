import 'package:base_ball_game/constants.dart';
import 'package:base_ball_game/models/inning.dart';

class Game {
  Game();

  bool get checkGameOver => innings.length == maxTurn;


  // 현재 게임의 정답
  List<int> answers = [];
  List<Inning> innings = [];

  settingGame() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    numbers.shuffle();
    List<int> selectedNumbers = List.empty(growable: true);
    while (selectedNumbers.length < 3) {
      selectedNumbers.add(numbers.removeAt(0));
    }
    innings = [];
    answers = selectedNumbers;
  }

  // 정답 체크
  Inning playInning(Inning inning) {
    inning.playBatting(answers);
    innings.add(inning);
    return inning;

  }
}
