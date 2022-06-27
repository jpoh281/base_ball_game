class Rule {
  // 숫자의 수
  static late final int numberOfBat;
  static late final int maxInning;

  static RegExp batRegExp = RegExp('[1-9]{1}');
  static RegExp numberOfBatRegExp = RegExp('^[1-9]{1}\$');
  static RegExp inningsRegExp = RegExp('[1-9]{1}\\d*');

  Rule._();

  static int parseMaxInning(String? answer) {
    var regExpResult = inningsRegExp.allMatches(answer ?? '').toList();
    if (regExpResult.isEmpty) {
      throw FormatException('0 초과하는 숫자를 입력해주세요.\n');
    }
    int.parse(regExpResult[0].group(0)!);
    return int.parse(regExpResult[0].group(0)!);
  }

  static int parseNumberOfBat(String? answer) {
    var regExpResult = numberOfBatRegExp.allMatches(answer ?? '').toList();
    if (regExpResult.isEmpty) {
      throw FormatException('[1-9] 사이의 숫자만 입력해주세요.\n');
    }
    int.parse(regExpResult[0].group(0)!);
    return int.parse(regExpResult[0].group(0)!);
  }
}
