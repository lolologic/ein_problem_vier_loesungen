import 'package:ein_problem_vier_loesungen/04_global/global_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Starts the app within a Riverpod [ProviderScope].
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// Configures the Flutter app and displays the global state variant.
class MyApp extends StatelessWidget {
  /// Creates the main application widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const GlobalHomepage(),
    );
  }
}
