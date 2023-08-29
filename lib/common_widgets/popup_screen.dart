import 'package:bmi_calculator/bmi_calculations.dart';
import 'package:flutter/material.dart';

class PopUpScreen extends StatelessWidget {
  const PopUpScreen({
    Key? key,
    required this.bmiCalc,
  }) : super(key: key);

  final BMICalculation bmiCalc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('BMI'),
      content: Text('${bmiCalc.calculateBMI(bmiCalc.weight, bmiCalc.height)}'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(); // dismisses only the dialog and returns nothing
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
