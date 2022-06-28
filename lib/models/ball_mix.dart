class BallMix {
  final List<int> _numbers;

  BallMix(this._numbers);

  factory BallMix.autoGenerate(int numberOfBat) {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    numbers.shuffle();

    List<int> selectedNumbers = [];

    while (selectedNumbers.length < numberOfBat) {
      selectedNumbers.add(numbers.removeAt(0));
    }

    return BallMix(selectedNumbers);
  }


  int ofIndex(int i) {
    return _numbers[i];
  }

  bool contains(int number) {
    return _numbers.contains(number);
  }

  @override
  String toString() {
    return _numbers.join(',');
  }
}
