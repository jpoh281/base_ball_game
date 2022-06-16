class ParseResult {}

class Success implements ParseResult{
  Success(this.parsedNumbers);

  final List<int> parsedNumbers;
}


class Error implements ParseResult{

  Error(this.message);

  final String message;

  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}