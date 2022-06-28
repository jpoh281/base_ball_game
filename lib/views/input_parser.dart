class InputParser {

  final RegExp _batRegExp = RegExp('[1-9]{1}');
  final RegExp _numberOfBatRegExp = RegExp('^[1-9]{1}\$');
  final RegExp _maxInningRegExp = RegExp('[1-9]{1}\\d*');

  List<int> parseToIntList(String input, int numberOfBat) {
    var regExpResult = _batRegExp.allMatches(input ?? '');

    if (regExpResult.length != numberOfBat) {
      throw FormatException('숫자를 $numberOfBat개만 입력해 주세요.\n');
    }

    var numbers =
        regExpResult.map((e) => int.parse(e.group(0).toString())).toList();

    if (numbers.toSet().length != numberOfBat) {
      throw FormatException('중복되는 숫자없이 입력해 주세요.\n');
    }

    return numbers;
  }

  int parseToNumberOfBat(String input) {
    var regExpResult = _numberOfBatRegExp.allMatches(input ?? '').toList();

    if (regExpResult.isEmpty) {
      throw FormatException('1-9 사이의 숫자만 입력해주세요.\n\n');
    }

    return int.parse(regExpResult[0].group(0)!);
  }

  int parseToMaxInning(String input) {
    var regExpResult = _maxInningRegExp.allMatches(input ?? '').toList();

    if (regExpResult.isEmpty) {
      throw FormatException('0 초과하는 숫자를 입력해주세요.\n');
    }

    return int.parse(regExpResult[0].group(0)!);
  }
}
