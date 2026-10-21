import 'package:flutter/material.dart';
import 'package:ein_problem_vier_loesungen/03_distributed_with_passive_widgets/distributed_passive_quadrant.dart';

/// Arranges two passive quadrants side by side.
class DistributedPassiveRow extends StatelessWidget {
  /// The counter value displayed in the left quadrant.
  final int leftCounterValue;

  /// Increment callback for the left quadrant.
  final VoidCallback leftOnIncrement;

  /// Decrement callback for the left quadrant.
  final VoidCallback leftOnDecrement;

  /// The counter value displayed in the right quadrant.
  final int rightCounterValue;

  /// Increment callback for the right quadrant.
  final VoidCallback rightOnIncrement;

  /// Decrement callback for the right quadrant.
  final VoidCallback rightOnDecrement;

  /// Creates a row with values and callbacks for both quadrants.
  const DistributedPassiveRow({
    super.key,
    required this.leftCounterValue,
    required this.leftOnIncrement,
    required this.leftOnDecrement,
    required this.rightCounterValue,
    required this.rightOnIncrement,
    required this.rightOnDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DistributedPassiveQuadrant(
            counterValue: leftCounterValue,
            onIncrement: leftOnIncrement,
            onDecrement: leftOnDecrement,
          ),
        ),
        Expanded(
          child: DistributedPassiveQuadrant(
            counterValue: rightCounterValue,
            onIncrement: rightOnIncrement,
            onDecrement: rightOnDecrement,
          ),
        ),
      ],
    );
  }
}
