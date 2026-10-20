import 'package:flutter/material.dart';
import 'package:ein_problem_vier_loesungen/02_distributed/distributed_quadrant.dart';

enum _CounterPosition { topLeft, topRight, bottomLeft, bottomRight }

class DistributedHomepage extends StatefulWidget {
  const DistributedHomepage({super.key});

  @override
  State<DistributedHomepage> createState() => _DistributedHomepageState();
}

class _DistributedHomepageState extends State<DistributedHomepage> {
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
            child: Row(
              children: [
                Expanded(
                  child: DistributedQuadrant(
                    counterValue: _counterTopLeft,
                    onIncrement: () =>
                        _incrementCounter(_CounterPosition.bottomRight),
                    onDecrement: () =>
                        _decrementCounter(_CounterPosition.bottomRight),
                  ),
                ),
                Expanded(
                  child: DistributedQuadrant(
                    counterValue: _counterTopRight,
                    onIncrement: () =>
                        _incrementCounter(_CounterPosition.bottomLeft),
                    onDecrement: () =>
                        _decrementCounter(_CounterPosition.bottomLeft),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: DistributedQuadrant(
                    counterValue: _counterBottomLeft,
                    onIncrement: () =>
                        _incrementCounter(_CounterPosition.topRight),
                    onDecrement: () =>
                        _decrementCounter(_CounterPosition.topRight),
                  ),
                ),
                Expanded(
                  child: DistributedQuadrant(
                    counterValue: _counterBottomRight,
                    onIncrement: () =>
                        _incrementCounter(_CounterPosition.topLeft),
                    onDecrement: () =>
                        _decrementCounter(_CounterPosition.topLeft),
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
