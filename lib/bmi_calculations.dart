import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class BMICalculation {
  String? genderSelection;
  int? weight;
  double? height;
  int? age;

  BMICalculation({
    this.genderSelection,
    this.weight,
    this.height,
    this.age,
  });

  double calculateBMI(weight, height /*, age, gender*/) {
    return (weight / (height * height) * 10000).roundToDouble(); //not correct
  }

  int changeWeightandAge(value, minusPlus) {
    if (minusPlus == "-") {
      if (value != 0) {
        return value - 1;
      } else {
        return value - 0;
      }
    } else {
      return value + 1;
    }
  }
}

final bmiInstanceProvider = Provider<BMICalculation>((ref) => BMICalculation());

//kanske rätt nu?
final bmiResultsProvider = Provider<BMICalculation>((ref) {
  BMICalculation bmiResultsObject = BMICalculation(
    genderSelection: "",
    weight: 50,
    height: 150,
    age: 20,
  );
  return bmiResultsObject;
});

final weightChangeProvider = Provider<int>((ref) {
  return ref.watch(bmiInstanceProvider).changeWeightandAge(0, "");
});
