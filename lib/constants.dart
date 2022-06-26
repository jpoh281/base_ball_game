const List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
const int maxInning = 20;
const int maxBat = 3;
// 0을 제외한 한자리의 숫자
RegExp digitExceptZero = RegExp('[1-9]{1}');

// 0을 제외한 양수
RegExp hundredMillionNumbersExceptZero = RegExp('[1-9]{9}');