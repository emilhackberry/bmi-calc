import 'package:bmi_calculator/bmi_calculations.dart';
import 'package:bmi_calculator/common_widgets/popup_screen.dart';
import 'package:bmi_calculator/common_widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEb1555);
const containerColor = Color.fromARGB(255, 74, 45, 125);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String selectionGenderMale = "";
  String selectionGenderFemale = "";

  BMICalculation bmiCalc = BMICalculation(
    genderSelection: "",
    weight: 50,
    height: 150,
    age: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => {
                      setState(() {
                        selectionGenderMale = "Male selected";
                        selectionGenderFemale = "";
                        bmiCalc.genderSelection = "Male";
                      })
                    },
                    child: ReusableCard(
                      color: containerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.man,
                            size: 80.0,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text("$selectionGenderMale", style: TextStyle(fontSize: 20.0)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => {
                      setState(() {
                        selectionGenderFemale = "Female selected";
                        selectionGenderMale = "";
                        bmiCalc.genderSelection = "Female";
                      })
                    },
                    child: ReusableCard(
                      color: containerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.woman,
                            size: 80.0,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text("$selectionGenderFemale", style: TextStyle(fontSize: 20.0)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: containerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text("${bmiCalc.height?.round()} cm", style: TextStyle(fontSize: 50.0)),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(),
                  Slider(
                    value: bmiCalc.height ?? 150,
                    max: 200,
                    divisions: 200,
                    onChanged: (double value) {
                      setState(() {
                        bmiCalc.height = value;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: containerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: TextStyle(fontSize: 20.0)),
                        SizedBox(
                          height: 15.0,
                        ),
                        Consumer(
                          builder: (BuildContext context, WidgetRef ref, Widget? child) {
                            final bmiResults = ref.watch(bmiResultsProvider);
                            return (Text(
                              "${bmiResults.weight}",
                              style: TextStyle(fontSize: 20.0),
                            ));
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Consumer(
                          builder: (BuildContext context, WidgetRef ref, Widget? child) {
                            final bmiResults = ref.watch(bmiResultsProvider);
                            return (Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FloatingActionButton(
                                    child: Icon(Icons.remove),
                                    onPressed: () {
                                      bmiResults.weight = bmiResults.changeWeightandAge(bmiResults.weight, "-");
                                    }),
                                FloatingActionButton(
                                    child: Icon(Icons.add),
                                    onPressed: () {
                                      bmiResults.weight = bmiResults.changeWeightandAge(bmiResults.weight, "+");
                                    }),
                              ],
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: containerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: TextStyle(fontSize: 20.0)),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text("${bmiCalc.age}", style: TextStyle(fontSize: 20.0)),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                                child: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    bmiCalc.age = bmiCalc.changeWeightandAge(bmiCalc.age, "-");
                                  });
                                }),
                            FloatingActionButton(
                              child: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  bmiCalc.age = bmiCalc.changeWeightandAge(bmiCalc.age, "+");
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 5.0),
            width: double.infinity,
            height: bottomContainerHeight,
            child: TextButton(
              child: Text(
                "Calculate",
                textScaleFactor: 2.0,
              ),
              onPressed: () async => {
                await showDialog(
                  context: context,
                  builder: (context) => PopUpScreen(bmiCalc: bmiCalc),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
