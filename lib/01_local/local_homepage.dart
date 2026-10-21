import 'package:flutter/material.dart';

enum _CounterPosition { topLeft, topRight, bottomLeft, bottomRight }

/// Manages all four counters and their UI in a single widget.
class LocalHomepage extends StatefulWidget {
  /// Creates the variant with local widget state.
  const LocalHomepage({super.key});

  @override
  State<LocalHomepage> createState() => _LocalHomepageState();
}

class _LocalHomepageState extends State<LocalHomepage> {
  int _counterTopLeft = 0;
  int _counterTopRight = 0;
  int _counterBottomLeft = 0;
  int _counterBottomRight = 0;

  void _incrementCounter(_CounterPosition counterPosition) {
    setState(() {
      switch (counterPosition) {
        case _CounterPosition.topLeft:
          _counterTopLeft++;
          break;
        case _CounterPosition.topRight:
          _counterTopRight++;
          break;
        case _CounterPosition.bottomLeft:
          _counterBottomLeft++;
          break;
        case _CounterPosition.bottomRight:
          _counterBottomRight++;
          break;
      }
    });
  }

  void _decrementCounter(_CounterPosition counterPosition) {
    setState(() {
      switch (counterPosition) {
        case _CounterPosition.topLeft:
          _counterTopLeft--;
          break;
        case _CounterPosition.topRight:
          _counterTopRight--;
          break;
        case _CounterPosition.bottomLeft:
          _counterBottomLeft--;
          break;
        case _CounterPosition.bottomRight:
          _counterBottomRight--;
          break;
      }
    });
  }

  int get _totalCounter =>
      _counterTopLeft +
      _counterTopRight +
      _counterBottomLeft +
      _counterBottomRight;

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
              '$_totalCounter',
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
              children: [
                Expanded(
                  child: Container(
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
                            onPressed: () =>
                                _incrementCounter(_CounterPosition.bottomRight),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w600,
                                ),
                            '$_counterTopLeft',
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            style: _decrementButtonStyle,
                            onPressed: () =>
                                _decrementCounter(_CounterPosition.bottomRight),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
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
                            onPressed: () =>
                                _incrementCounter(_CounterPosition.bottomLeft),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w600,
                                ),
                            '$_counterTopRight',
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            style: _decrementButtonStyle,
                            onPressed: () =>
                                _decrementCounter(_CounterPosition.bottomLeft),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
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
                            onPressed: () =>
                                _incrementCounter(_CounterPosition.topRight),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w600,
                                ),
                            '$_counterBottomLeft',
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            style: _decrementButtonStyle,
                            onPressed: () =>
                                _decrementCounter(_CounterPosition.topRight),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
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
                            onPressed: () =>
                                _incrementCounter(_CounterPosition.topLeft),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w600,
                                ),
                            '$_counterBottomRight',
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            style: _decrementButtonStyle,
                            onPressed: () =>
                                _decrementCounter(_CounterPosition.topLeft),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
