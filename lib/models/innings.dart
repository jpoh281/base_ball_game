import 'package:base_ball_game/models/inning.dart';
import 'package:base_ball_game/models/rule.dart';

class Innings {

  final int maxInning;

  Innings(this.maxInning);

  List<Inning> _innings = [];

  int get nowInning => _innings.length + 1;

  bool get isFull => _innings.length == Rule.maxInning;

  void add(Inning inning){
    _innings.add(inning);
  }

  void reset(){
    _innings = [];
  }

  @override
  String toString() {
    return _innings.join();
  }
}