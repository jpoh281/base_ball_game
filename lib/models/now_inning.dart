class NowInning {
  int value;

  NowInning([this.value = 1]);

  void countUp() {
    value++;
  }

  void reset() {
    value = 0;
  }
}
