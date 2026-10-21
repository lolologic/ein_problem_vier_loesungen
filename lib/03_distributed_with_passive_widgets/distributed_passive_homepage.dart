import 'package:ein_problem_vier_loesungen/03_distributed_with_passive_widgets/distributed_passive_row.dart';
import 'package:flutter/material.dart';

enum _CounterPosition { topLeft, topRight, bottomLeft, bottomRight }

/// Manages the counters and passes data and callbacks through passive row widgets.
class DistributedPassiveHomepage extends StatefulWidget {
  /// Creates the variant with passive rows and quadrants.
  const DistributedPassiveHomepage({super.key});

  @override
  State<DistributedPassiveHomepage> createState() =>
      _DistributedPassiveHomepageState();
}

class _DistributedPassiveHomepageState
    extends State<DistributedPassiveHomepage> {
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
            child: DistributedPassiveRow(
              leftCounterValue: _counterTopLeft,
              leftOnIncrement: () =>
                  _incrementCounter(_CounterPosition.bottomRight),
              leftOnDecrement: () =>
                  _decrementCounter(_CounterPosition.bottomRight),
              rightCounterValue: _counterTopRight,
              rightOnIncrement: () =>
                  _incrementCounter(_CounterPosition.bottomLeft),
              rightOnDecrement: () =>
                  _decrementCounter(_CounterPosition.bottomLeft),
            ),
          ),
          Expanded(
            child: DistributedPassiveRow(
              leftCounterValue: _counterBottomLeft,
              leftOnIncrement: () =>
                  _incrementCounter(_CounterPosition.topRight),
              leftOnDecrement: () =>
                  _decrementCounter(_CounterPosition.topRight),
              rightCounterValue: _counterBottomRight,
              rightOnIncrement: () =>
                  _incrementCounter(_CounterPosition.topLeft),
              rightOnDecrement: () =>
                  _decrementCounter(_CounterPosition.topLeft),
            ),
          ),
        ],
      ),
    );
  }
}
