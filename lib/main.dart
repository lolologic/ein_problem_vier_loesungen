import 'package:flutter/material.dart';
import 'package:ein_problem_vier_loesungen/02_distributed/distributed_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const DistributedHomepage(),
    );
  }
}
