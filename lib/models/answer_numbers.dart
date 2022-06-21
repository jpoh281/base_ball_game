class AnswerNumbers {
  AnswerNumbers(this.numbers);

  final List<int> numbers;

  factory AnswerNumbers.setNumbers() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    numbers.shuffle();
    List<int> selectedNumbers = List.empty(growable: true);
    while (selectedNumbers.length < 3) {
      selectedNumbers.add(numbers.removeAt(0));
    }
    var answers = selectedNumbers;

    return AnswerNumbers(answers);
  }
}
