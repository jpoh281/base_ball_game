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
    return Batter(selectedNumbers);
  }

  bool didMissSwing(int index, int pitchingBall) =>
      _numbers[index] == pitchingBall;

  bool didLook(int pitchingBall) => _numbers.contains(pitchingBall);

  @override
  String toString() {
    return _numbers.join();
  }
}
