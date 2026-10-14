import 'package:flutter/material.dart';

enum _CounterPosition { topLeft, topRight, bottomLeft, bottomRight }

class LocalHomepage extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('$_totalCounter'),
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => _incrementCounter(
                                  _CounterPosition.bottomRight,
                                ),
                              ),
                              Text(
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium,
                                '$_counterTopLeft',
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => _decrementCounter(
                                  _CounterPosition.bottomRight,
                                ),
                              ),
                            ],
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => _incrementCounter(
                                  _CounterPosition.bottomLeft,
                                ),
                              ),
                              Text(
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium,
                                '$_counterTopRight',
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => _decrementCounter(
                                  _CounterPosition.bottomLeft,
                                ),
                              ),
                            ],
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => _incrementCounter(
                                  _CounterPosition.topRight,
                                ),
                              ),
                              Text(
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium,
                                '$_counterBottomLeft',
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => _decrementCounter(
                                  _CounterPosition.topRight,
                                ),
                              ),
                            ],
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () =>
                                    _incrementCounter(_CounterPosition.topLeft),
                              ),
                              Text(
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium,
                                '$_counterBottomRight',
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () =>
                                    _decrementCounter(_CounterPosition.topLeft),
                              ),
                            ],
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
