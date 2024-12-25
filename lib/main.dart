import 'package:flutter/material.dart';
import 'package:ripnyi_sks_24_1/screens/students.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Students(),
    );
  }
}
