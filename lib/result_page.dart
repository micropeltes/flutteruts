import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double valueslider;
  final bool gender;
  final int weight;

  ResultPage(
      {required this.valueslider, required this.gender, required this.weight});

  @override
  Widget build(BuildContext context) {
    double bmi =
        weight / ((valueslider / 100) * (valueslider / 100)); // BMI formula

    String bmiClassification = getBMIClassification(gender, bmi);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // Text outside the border
            Container(
              padding: EdgeInsets.only(
                  top: 50, bottom: 10), // Adjust top and bottom padding
              child: Text(
                'Result',
                style: TextStyle(fontSize: 28.0, color: Colors.white),
              ),
            ),
            // Existing content with border
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 20), // Adjust the top margin
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // New row to display BMI classification
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 160),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BMI Classification: $bmiClassification',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 160),
                    child: Text(
                      'Tinggi badan: ${valueslider.round()}cm',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 160),
                        child: Text(
                          gender ? 'gender: Male' : 'gender: Female',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 160),
                        child: Text(
                          'Berat badan: ${weight}kg',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      // New row to display BMI
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 160),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'BMI: ${bmi.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // "RE-CALCULATE" button outside the inner border
            Container(
              padding: EdgeInsets.symmetric(vertical: 75, horizontal: 100),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('RE-CALCULATE', style: TextStyle(fontSize: 25.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to get BMI classification based on gender and BMI value
  String getBMIClassification(bool isMale, double bmi) {
    if (isMale) {
      if (bmi < 18) {
        return 'Underweight';
      } else if (bmi >= 18 && bmi <= 25) {
        return 'Normal';
      } else if (bmi > 25 && bmi <= 27) {
        return 'Overweight';
      } else {
        return 'Obese';
      }
    } else {
      if (bmi < 17) {
        return 'Underweight';
      } else if (bmi >= 17 && bmi <= 23) {
        return 'Normal';
      } else if (bmi > 23 && bmi <= 27) {
        return 'Overweight';
      } else {
        return 'Obese';
      }
    }
  }
}
