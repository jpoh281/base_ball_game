import 'package:base_ball_game/models/inning_result.dart';

class Game {
  Game();

  // 종료 턴
  final int endTurn = 20;
  // 현재 게임의 턴
  int nowTurn = 0;
  bool get checkGameOver => nowTurn == endTurn;

  // 현재 게임의 정답
  List<int> answers = [];

  settingGame() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    numbers.shuffle();
    List<int> selectedNumbers = List.empty(growable: true);
    while (selectedNumbers.length < 3) {
      selectedNumbers.add(numbers.removeAt(0));
    }
    answers = selectedNumbers;
  }

  // 정답 체크
  InningResult checkAnswer(List<int> numbers) {
    if (checkGameOver) {
      return Lose();
    }

    int strikes = 0;
    int balls = 0;

    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == numbers[i]) {
        strikes++;
        continue;
      }
      if (answers.contains(numbers[i])) {
        balls++;
      }
    }

    nowTurn++;
    return InningResult.parse(strikes, balls);
  }
}
