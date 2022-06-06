List<int> initializeGame() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  numbers.shuffle();
  List<int> selectedNumbers = [];
  while (selectedNumbers.length < 3) {
    selectedNumbers.add(numbers.removeAt(0));
  }
  return selectedNumbers;
}
