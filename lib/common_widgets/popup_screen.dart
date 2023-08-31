import 'package:bmi_calculator/bmi_calculations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopUpScreen extends ConsumerWidget {
  const PopUpScreen({
    Key? key,
    required this.bmiCalc,
  }) : super(key: key);

  final BMICalculation1 bmiCalc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(weightCountProvider);
    return AlertDialog(
      title: Text('BMI'),
      content: Text('${bmiCalc.calculateBMI(data.weight, data.height)}'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
