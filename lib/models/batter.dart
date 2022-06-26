import 'package:base_ball_game/constants.dart';

class Batter {
  Batter(this._numbers);

  final List<int> _numbers;

  factory Batter.warmUp() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    numbers.shuffle();

    List<int> selectedNumbers = [];

    while (selectedNumbers.length < maxBat) {
      selectedNumbers.add(numbers.removeAt(0));
    }

    selectedNumbers.iterator.current;
    return Batter(selectedNumbers);
  }

  bool didMissSwing(int pitchingBall) =>
      _numbers.iterator.current == pitchingBall;

  bool didLook(int pitchingBall) => _numbers.contains(pitchingBall);

  bool hasBallCount() => _numbers.iterator.moveNext();
}
