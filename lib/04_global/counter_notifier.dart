import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ein_problem_vier_loesungen/04_global/counter_state.dart';

class CounterNotifier extends Notifier<CounterState> {
  @override
  CounterState build() {
    return const CounterState();
  }

  void incrementTopLeft() {
    state = state.copyWith(
      topLeft: state.topLeft + 1,
    );
  }
}
