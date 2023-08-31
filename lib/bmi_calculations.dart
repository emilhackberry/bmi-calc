import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'bmi_calculations.g.dart';

class BMIState {
  String? genderSelection;
  int weight;
  double height;
  int age;

  BMIState({
    this.genderSelection,
    required this.weight,
    required this.height,
    required this.age,
  });

  BMIState copyWith({int? weight, int? age, double? height}) {
    return BMIState(
      genderSelection: genderSelection,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
    );
  }
}

// @riverpod
// StateNotifier<BMICalculation1, BMIState> weightCount(WeightCountRef ref) {
//   return BMICalculation1(
//     weight: 50,
//     height: 130,
//     age: 25,
//     genderSelection: "",
//   );
// }

final weightCountProvider = StateNotifierProvider<BMICalculation1, BMIState>((ref) {
  return BMICalculation1(
    weight: 50,
    height: 130,
    age: 25,
    genderSelection: "",
  );
});

class BMICalculation1 extends StateNotifier<BMIState> {
  BMICalculation1({
    String? genderSelection,
    int weight = 0,
    double height = 0,
    int age = 0,
  }) : super(BMIState(
          genderSelection: genderSelection,
          weight: weight,
          height: height,
          age: age,
        ));

  void incrementWeight(int weight) {
    state = state.copyWith(weight: state.weight++);
  }

  void incrementAge(int age) {
    state = state.copyWith(age: state.age++);
  }

  void changeHeight(double height) {
    state = state.copyWith(height: state.height = height);
  }

  int calculateBMI(int weight, double height) {
    return (weight / (height * height) * 10000).round();
  }
}
