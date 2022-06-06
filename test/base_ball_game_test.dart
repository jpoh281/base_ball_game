import 'package:base_ball_game/base_ball_game.dart';
import 'package:test/test.dart';

void main() {
  test('initializeGame', () {
    List<int> selectedNumbers = initializeGame();
    print(selectedNumbers.toString());

    expect(selectedNumbers.length, 3);
    expect(selectedNumbers.toSet().length, 3);
  });

  group('REGEXP', () {

  });
}
