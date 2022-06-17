class ParseResult {}

class Success implements ParseResult{
  const Success(this.parsedNumbers);

  final List<int> parsedNumbers;
}


class Error implements ParseResult{

  const Error(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}