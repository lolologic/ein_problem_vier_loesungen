import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ein_problem_vier_loesungen/04_global/counter_notifier.dart';
import 'package:ein_problem_vier_loesungen/04_global/counter_position.dart';
import 'package:ein_problem_vier_loesungen/04_global/global_quadrant.dart';
import 'package:flutter/material.dart';

/// Displays the dashboard using shared Riverpod state.
class GlobalHomepage extends ConsumerWidget {
  /// Creates the dashboard for the global state variant.
  const GlobalHomepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
        title: const Text('Counter Dashboard'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${counterState.totalCounter}',
              style: const TextStyle(color: Color(0xFF0F766E)),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF3F4F6),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: GlobalQuadrant(position: CounterPosition.topLeft),
                ),
                Expanded(
                  child: GlobalQuadrant(position: CounterPosition.topRight),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: GlobalQuadrant(position: CounterPosition.bottomLeft),
                ),
                Expanded(
                  child: GlobalQuadrant(position: CounterPosition.bottomRight),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
