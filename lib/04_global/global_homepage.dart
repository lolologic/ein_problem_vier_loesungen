import 'package:ein_problem_vier_loesungen/04_global/global_quadrant.dart';
import 'package:flutter/material.dart';

enum _CounterPosition { topLeft, topRight, bottomLeft, bottomRight }

class GlobalHomepage extends StatefulWidget {
  const GlobalHomepage({super.key});

  @override
  State<GlobalHomepage> createState() => _GlobalHomepageState();
}

class _GlobalHomepageState extends State<GlobalHomepage> {
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
                  child: GlobalQuadrant(
                    counterValue: _counterTopLeft,
                    onIncrement: () =>
                        _incrementCounter(_CounterPosition.bottomRight),
                    onDecrement: () =>
                        _decrementCounter(_CounterPosition.bottomRight),
                  ),
                ),
                Expanded(
                  child: GlobalQuadrant(
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
                  child: GlobalQuadrant(
                    counterValue: _counterBottomLeft,
                    onIncrement: () =>
                        _incrementCounter(_CounterPosition.topRight),
                    onDecrement: () =>
                        _decrementCounter(_CounterPosition.topRight),
                  ),
                ),
                Expanded(
                  child: GlobalQuadrant(
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
