import 'package:base_ball_game/models/inning.dart';

class Innings {

  final int maxInning;

  Innings(this.maxInning);

  List<Inning> _innings = [];

  int get nowInning => _innings.length + 1;

  bool get isFull => _innings.length == maxInning;

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