import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  Color basicColor = const Color.fromRGBO(25, 25, 40, 1);

  DataModel user = DataModel();
  double _currentValue = 0;
  int counter1 = 0;
  int counter2 = 0;
  bool isSelectedMale = false;
  bool isSelectedFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TextButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.red)),
          onPressed: () {
            if (isSelectedMale == false && isSelectedFemale == false) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Please select male or female')));
            } else {
              if (counter2 == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter your age')));
              }
              if (counter1 == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter your weight')));
              }
              if (_currentValue == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter your height')));
              }
              user.age = counter2;
              user.weight = counter1;
              user.height = _currentValue;
              user.gender = isSelectedMale ? 'Male' : 'Female';
              print(user.gender);
            }
          },
          child: const Text(
            'Calculate',
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
        padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    isSelectedMale = !isSelectedMale;
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: isSelectedMale
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
                GestureDetector(
                  onTap: () => setState(() {
                    isSelectedFemale = !isSelectedFemale;
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: isSelectedFemale
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
                )
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(12),
              width: 400,
              height: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: basicColor),
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
                      Text(
                        _currentValue.toInt().toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
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
                  Slider(
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey,
                    value: _currentValue,
                    min: 0,
                    max: 251,
                    divisions: 251,
                    onChanged: (value) {
                      setState(() {
                        _currentValue = value;
                      });
                    },
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
                      Text(
                        '$counter1',
                        style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.black26)),
                            onPressed: () {
                              setState(() {
                                counter1++;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.black26)),
                            onPressed: () {
                              setState(() {
                                if (counter1 == 0) return;
                                counter1--;
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              size: 40,
                              color: Colors.white,
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
                      Text(
                        '$counter2',
                        style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.black26)),
                            onPressed: () {
                              setState(() {
                                counter2++;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.black26)),
                            onPressed: () {
                              setState(() {
                                if (counter2 == 0) return;
                                counter2--;
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              size: 40,
                              color: Colors.white,
                            ),
                          )
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
