import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ein_problem_vier_loesungen/04_global/counter_state.dart';
import 'package:ein_problem_vier_loesungen/04_global/counter_position.dart';

final counterProvider = NotifierProvider<CounterNotifier, CounterState>(
  CounterNotifier.new,
);

class CounterNotifier extends Notifier<CounterState> {
  @override
  CounterState build() {
    return const CounterState();
  }

  void incrementCounter(CounterPosition counterPosition) {
    switch (counterPosition) {
      case CounterPosition.topLeft:
        state = state.copyWith(topLeft: state.topLeft + 1);
      case CounterPosition.topRight:
        state = state.copyWith(topRight: state.topRight + 1);
      case CounterPosition.bottomLeft:
        state = state.copyWith(bottomLeft: state.bottomLeft + 1);
      case CounterPosition.bottomRight:
        state = state.copyWith(bottomRight: state.bottomRight + 1);
    }
  }

  void decrementCounter(CounterPosition counterPosition) {
    switch (counterPosition) {
      case CounterPosition.topLeft:
        state = state.copyWith(topLeft: state.topLeft - 1);
      case CounterPosition.topRight:
        state = state.copyWith(topRight: state.topRight - 1);
      case CounterPosition.bottomLeft:
        state = state.copyWith(bottomLeft: state.bottomLeft - 1);
      case CounterPosition.bottomRight:
        state = state.copyWith(bottomRight: state.bottomRight - 1);
    }
  }
}
