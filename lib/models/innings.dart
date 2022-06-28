import 'package:base_ball_game/models/inning.dart';

class Innings {

  Innings([List<Inning>? innings]) : _innings = innings ?? [];

  final List<Inning> _innings;

  void add(Inning inning) {
    _innings.add(inning);
  }

  @override
  String toString() {
    return _innings.join();
  }
}
