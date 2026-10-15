import 'package:flutter/material.dart';

class DistributedQuadrant extends StatelessWidget {
  final int counterValue;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const DistributedQuadrant({
    super.key,
    required this.counterValue,
    required this.onIncrement,
    required this.onDecrement,
    required MainAxisSize mainAxisSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(icon: const Icon(Icons.add), onPressed: onIncrement),
        Text('$counterValue'),
        IconButton(icon: const Icon(Icons.remove), onPressed: onDecrement),
      ],
    );
  }
}
