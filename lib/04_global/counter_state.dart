/// Immutable state containing all four counter values.
class CounterState {
  /// Counter value at the top-left position.
  final int topLeft;

  /// Counter value at the top-right position.
  final int topRight;

  /// Counter value at the bottom-left position.
  final int bottomLeft;

  /// Counter value at the bottom-right position.
  final int bottomRight;

  /// Creates a state with unspecified counter values initialized to zero.
  const CounterState({
    this.topLeft = 0,
    this.topRight = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
  });

  /// Returns a new state with the provided counter values.
  ///
  /// Unspecified counter values remain unchanged.
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

  /// Sum of all four counter values.
  int get totalCounter => topLeft + topRight + bottomLeft + bottomRight;
}
