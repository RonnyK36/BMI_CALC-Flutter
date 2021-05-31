import 'package:bmi_calc/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card_content.dart';
import '../components/reusable_card.dart';
import '../components/constants.dart';
import 'calc_formula.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int? height = 120;
  int weight = 60;
  int age = 20;
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALC',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      cardChild: CardContent(
                        cardIcon: FontAwesomeIcons.mars,
                        cardLabel: 'MALE',
                      ),
                      reusableColor: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      cardChild: CardContent(
                        cardIcon: FontAwesomeIcons.venus,
                        cardLabel: 'FEMALE',
                      ),
                      reusableColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              height.toString(),
                              style: kValueSize,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Slider(
                            value: height == null ? 120.00 : height!.toDouble(),
                            min: 45.0,
                            max: 220.0,
                            activeColor: Color(0xFFFEB1555),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      ],
                    ),
                    reusableColor: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              weight.toString(),
                              style: kValueSize,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 3) {
                                    weight--;
                                  }
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  if (weight < 150) {
                                    weight++;
                                  }
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    reusableColor: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              age.toString(),
                              style: kValueSize,
                            ),
                            Text(
                              'yrs',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            TextButton(
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (age < 78) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    reusableColor: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            width: double.infinity,
            height: kBottomContainerHeight,
            // padding: EdgeInsets.only(bottom: 10),
            child: TextButton(
              child: Text(
                'Calc BMI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              onPressed: () {
                CalculatorFormula calc =
                    CalculatorFormula(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResults: calc.calculateBMI(),
                      feedback: calc.getFeedback(),
                      resultText: calc.getResult(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
//
// class RoundIconButton extends StatelessWidget {
//   RoundIconButton({@required this.floatingIcon, this.performOperation});
//
//   final IconData? floatingIcon;
//   final Function? performOperation;
//
//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       fillColor: Color(0xFF4C4E5E),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       // shape: CircleBorder(),
//       constraints: BoxConstraints.tightFor(
//         width: 50,
//         height: 50,
//       ),
//       elevation: 6,
//       child: Icon(floatingIcon),
//       onPressed: performOperation!(),
//     );
//   }
// }
