import 'package:flutter/material.dart';

/// Displays a counter without owning state or counter logic.
class DistributedPassiveQuadrant extends StatelessWidget {
  /// The currently displayed counter value.
  final int counterValue;

  /// Increment callback provided by the parent widget.
  final VoidCallback onIncrement;

  /// Decrement callback provided by the parent widget.
  final VoidCallback onDecrement;

  /// Creates a passive quadrant with its value and callbacks.
  const DistributedPassiveQuadrant({
    super.key,
    required this.counterValue,
    required this.onIncrement,
    required this.onDecrement,
  });

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
  Widget build(BuildContext context) {
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
              onPressed: onIncrement,
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
              onPressed: onDecrement,
            ),
          ],
        ),
      ),
    );
  }
}
