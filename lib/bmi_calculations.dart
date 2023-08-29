class BMICalculation {
  String? genderSelection;
  int? weight;
  double height;
  int? age;

  BMICalculation({
    required this.genderSelection,
    required this.weight,
    required this.height,
    required this.age,
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
