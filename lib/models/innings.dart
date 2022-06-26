import 'package:base_ball_game/models/inning.dart';

class Innings {

  List<Inning> _innings = [];

  int get nowInning => _innings.length + 1;

  int get length => _innings.length;

  void add(Inning inning){
    _innings.add(inning);
  }

  @override
  String toString() {
    return _innings.join();
  }
}