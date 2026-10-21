class CounterState {
  final int topLeft;
  final int topRight;
  final int bottomLeft;
  final int bottomRight;

  const CounterState({
    this.topLeft = 0,
    this.topRight = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
  });

  CounterState copyWith({
    int? topLeft,
    int? topRight,
    int? bottomLeft,
    int? bottomRight,
  }) {
    return CounterState(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
    );
  }

  int get totalCounter => topLeft + topRight + bottomLeft + bottomRight;
}
