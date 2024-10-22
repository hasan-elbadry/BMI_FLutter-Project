import 'package:flutter/material.dart';
import 'package:flutter_5_projects/Provider/BmiProvider.dart';
import 'package:flutter_5_projects/result.dart';
import 'package:provider/provider.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  static const String route = '/BmiCalculator';

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  Color basicColor = const Color.fromRGBO(25, 25, 40, 1);

  DataModel user = DataModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BmiProvider(),
      child: Scaffold(
        bottomNavigationBar: Consumer(
          builder: (context, BmiProvider provider, child) => TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
              onPressed: () {
                if (provider.isSelectedMale == false &&
                    provider.isSelectedFemale == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please select male or female')));
                } else {
                  if (provider.age == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter your age')));
                  }
                  if (provider.weight == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please enter your weight'),
                      showCloseIcon: true,
                    ));
                  }
                  if (provider.height == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please enter your height')));
                  }
                  user.age = provider.age;
                  user.weight = provider.weight;
                  user.height = provider.height;
                  user.gender = provider.isSelectedMale ? 'Male' : 'Female';
                  Navigator.of(context)
                      .pushNamed(ResultPage.route, arguments: user);
                }
              },
              child: const Text(
                'Calculate',
                style: TextStyle(color: Colors.white, fontSize: 30),
              )),
        ),
        backgroundColor: const Color.fromRGBO(35, 40, 33, 1),
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer(
                      builder: (context, BmiProvider provider, child) =>
                          GestureDetector(
                        onTap: provider.maleClicked,
                        child: Container(
                          padding: const EdgeInsets.all(13),
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: provider.isSelectedMale
                                ? Colors.red
                                : const Color.fromRGBO(25, 25, 40, 1),
                          ),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.male,
                                size: 100,
                                color: Colors.white,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Consumer(
                      builder: (context, BmiProvider provider, child) =>
                          GestureDetector(
                        onTap: provider.femaleClicked,
                        child: Container(
                          padding: const EdgeInsets.all(13),
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: provider.isSelectedFemale
                                ? Colors.red
                                : const Color.fromRGBO(25, 25, 40, 1),
                          ),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.female,
                                size: 100,
                                color: Colors.white,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: 400,
                  height: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: basicColor),
                  child: Column(
                    children: [
                      const Text(
                        'Height',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Consumer(
                            builder: (context, BmiProvider provider, child) =>
                                Text(
                              provider.height.toInt().toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, left: 5),
                            child: const Text(
                              'cm',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Consumer(
                        builder: (context, BmiProvider provider, child) =>
                            Slider(
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey,
                          value: provider.height,
                          min: 0,
                          max: 251,
                          divisions: 251,
                          onChanged: provider.setHeight,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: const Color.fromRGBO(25, 25, 40, 1),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Weight',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                          Consumer(
                            builder: (context, BmiProvider provider, child) =>
                                Text(
                              provider.weight.toString(),
                              style: const TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Consumer(
                                builder:
                                    (context, BmiProvider provider, child) =>
                                        IconButton(
                                  style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          Colors.black26)),
                                  onPressed: () {
                                    provider.incrementWeight();
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Consumer(
                                builder:
                                    (context, BmiProvider provider, child) =>
                                        IconButton(
                                  style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          Colors.black26)),
                                  onPressed: () {
                                    provider.decrementWeight();
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: const Color.fromRGBO(25, 25, 40, 1),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Age',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                          Consumer(
                            builder: (context, BmiProvider provider, child) =>
                                Text(
                              provider.age.toString(),
                              style: const TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Consumer(
                                builder:
                                    (context, BmiProvider provider, child) =>
                                        IconButton(
                                  style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          Colors.black26)),
                                  onPressed: () {
                                    provider.incrementAge();
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Consumer(
                                builder:
                                    (context, BmiProvider provider, child) =>
                                        IconButton(
                                  style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          Colors.black26)),
                                  onPressed: () {
                                    provider.decrementAge();
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DataModel {
  DataModel();

  String gender = '';
  double height = 0;
  int weight = 0;
  int age = 0;
}
