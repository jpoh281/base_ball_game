import 'package:base_ball_game/constants.dart';

class PitchingNumbers {
  PitchingNumbers(this.numbers);

  final List<int> numbers;

  factory PitchingNumbers.setNumbers() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    numbers.shuffle();
    List<int> selectedNumbers = List.empty(growable: true);
    while (selectedNumbers.length < maxBat) {
      selectedNumbers.add(numbers.removeAt(0));
    }
    var answers = selectedNumbers;

    return PitchingNumbers(answers);
  }
}
