import 'package:flutter/material.dart';
import 'package:ein_problem_vier_loesungen/03_distributed_with_passive_widgets/distributed_passive_quadrant.dart';

class DistributedPassiveRow extends StatelessWidget {
  final int leftCounterValue;
  final VoidCallback leftOnIncrement;
  final VoidCallback leftOnDecrement;

  final int rightCounterValue;
  final VoidCallback rightOnIncrement;
  final VoidCallback rightOnDecrement;

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
