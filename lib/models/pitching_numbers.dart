import 'package:base_ball_game/constants.dart';

class PitchingNumbers {
  PitchingNumbers(this._numbers);

  final List<int> _numbers;

  factory PitchingNumbers.setNumbers() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    numbers.shuffle();

    List<int> selectedNumbers = List.empty(growable: true);

    while (selectedNumbers.length < maxBat) {
      selectedNumbers.add(numbers.removeAt(0));
    }

    return PitchingNumbers(selectedNumbers);
  }

  int ofIndex(int i) => _numbers[i];

  bool hasBall(int numberOfIndex) => _numbers.contains(numberOfIndex);
}
