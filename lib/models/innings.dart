import 'package:base_ball_game/models/inning.dart';

class Innings {

  static late final int maxInning;
  static RegExp inningsRegExp = RegExp('[1-9]{1}\\d*');

  Innings();

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