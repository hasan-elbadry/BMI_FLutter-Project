import 'package:flutter/material.dart';
import 'package:flutter_5_projects/bmi_calculator.dart';
import 'package:flutter_5_projects/result.dart';

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
      initialRoute: BmiCalculator.route,
      routes: {
        ResultPage.route: (context) => const ResultPage(),
        BmiCalculator.route: (context) => const BmiCalculator(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
