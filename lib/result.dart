import 'package:flutter/material.dart';
import 'package:flutter_5_projects/bmi_calculator.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  static const String route = '/result';

  @override
  Widget build(BuildContext context) {
    DataModel user = ModalRoute.settingsOf(context)!.arguments as DataModel;
    return Scaffold(
      bottomNavigationBar: TextButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.red)),
          onPressed: () {},
          child: const Text(
            'Re-Calculate',
            style: TextStyle(color: Colors.white, fontSize: 30),
          )),
      backgroundColor: const Color.fromRGBO(35, 40, 33, 1),
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Your Result',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white),
            ),
            Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(25, 25, 40, 1),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    user.gender,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    user.height.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    user.weight.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    user.age.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
