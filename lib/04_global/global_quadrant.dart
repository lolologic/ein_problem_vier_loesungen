import 'package:ein_problem_vier_loesungen/04_global/counter_notifier.dart';
import 'package:ein_problem_vier_loesungen/04_global/counter_position.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class GlobalQuadrant extends ConsumerWidget {
  final CounterPosition position;

  const GlobalQuadrant({super.key, required this.position});

  static const ButtonStyle _incrementButtonStyle = ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    fixedSize: WidgetStatePropertyAll(Size(48, 48)),
    backgroundColor: WidgetStatePropertyAll(Color(0xFF0D9488)),
    foregroundColor: WidgetStatePropertyAll(Colors.white),
  );

  static const ButtonStyle _decrementButtonStyle = ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    fixedSize: WidgetStatePropertyAll(Size(48, 48)),
    backgroundColor: WidgetStatePropertyAll(Color(0xFFE76F66)),
    foregroundColor: WidgetStatePropertyAll(Colors.white),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final CounterPosition oppositePosition;

    final counterValue = ref.watch(
      counterProvider.select((state) {
        switch (position) {
          case CounterPosition.topLeft:
            return state.topLeft;
          case CounterPosition.topRight:
            return state.topRight;
          case CounterPosition.bottomLeft:
            return state.bottomLeft;
          case CounterPosition.bottomRight:
            return state.bottomRight;
        }
      }),
    );

    switch (position) {
      case CounterPosition.topLeft:
        oppositePosition = CounterPosition.bottomRight;
      case CounterPosition.topRight:
        oppositePosition = CounterPosition.bottomLeft;
      case CounterPosition.bottomLeft:
        oppositePosition = CounterPosition.topRight;
      case CounterPosition.bottomRight:
        oppositePosition = CounterPosition.topLeft;
    }

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              style: _incrementButtonStyle,
              onPressed: () => ref
                  .read(counterProvider.notifier)
                  .incrementCounter(oppositePosition),
            ),
            const SizedBox(width: 8),
            Text(
              '$counterValue',
              style: Theme.of(context).textTheme.headlineMedium
                  ?.copyWith(fontSize: 34, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.remove),
              style: _decrementButtonStyle,
              onPressed: () => ref
                  .read(counterProvider.notifier)
                  .decrementCounter(oppositePosition),
            ),
          ],
        ),
      ),
    );
  }
}
