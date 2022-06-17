import 'package:base_ball_game/constants.dart';
import 'package:base_ball_game/models/inning_result.dart';
import 'package:base_ball_game/models/parse_result.dart';

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
  InningResult checkAnswer(Success success) {
    if (checkGameOver) {
      return Lose();
    }

    int strikes = 0;
    int balls = 0;

    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == success.parsedNumbers[i]) {
        strikes++;
        continue;
      }
      if (answers.contains(success.parsedNumbers[i])) {
        balls++;
      }
    }

    nowTurn++;
    return InningResult.parse(strikes, balls);
  }

  ParseResult parse(String? answer) {
    var regResult = rule.allMatches(answer ?? '');
    if (regResult.length != 3) {
      return Error("숫자를 세개만 입력해 주세요.\n");
    }

    var numbers =
        regResult.map((e) => int.parse(e.group(0).toString())).toList();
    if (numbers.toSet().length != 3) {
      return Error("중복되는 숫자 없이 입력해 주세요.\n");
    }

    return Success(numbers);
  }
}
