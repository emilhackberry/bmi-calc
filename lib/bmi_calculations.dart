import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

////
///
///using the stuff below now

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

  BMIState copyWith({int? weight}) {
    return BMIState(
      genderSelection: genderSelection,
      weight: weight ?? this.weight,
      height: height,
      age: age,
    );
  }
}

///
///
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
  // void incrementWeight(int weight) {
  //   state = state.copyWith(weight: state.weight++);
  // }
  void incrementWeight(int weight) => state = state.copyWith(weight: state.weight++);
}
////

