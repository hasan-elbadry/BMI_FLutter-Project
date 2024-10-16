import 'package:flutter/material.dart';
import 'package:flutter_5_projects/bmi_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const BmiCalculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}
