import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiProvider extends ChangeNotifier {
  double height = 0;
  int weight = 0;
  int age = 0;
  bool isSelectedMale = false;
  bool isSelectedFemale = false;

  void maleClicked() {
    if (isSelectedFemale == true) {
      isSelectedFemale = false;
    }
    isSelectedMale = !isSelectedMale;
    notifyListeners();
  }

  void femaleClicked() {
    if (isSelectedMale == true) {
      isSelectedMale = false;
    }
    isSelectedFemale = !isSelectedFemale;
    notifyListeners();
  }

  void setHeight(double value) {
    height = value;
    notifyListeners();
  }

  void incrementAge() {
    age++;
    notifyListeners();
  }

  void decrementAge() {
    age > 0 ? age-- : age;
    notifyListeners();
  }

  void incrementWeight() {
    weight++;
    notifyListeners();
  }

  void decrementWeight() {
    weight > 0 ? weight-- : weight;
    notifyListeners();
  }
}
