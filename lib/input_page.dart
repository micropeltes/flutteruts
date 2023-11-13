import 'package:flutter/material.dart';
import 'result_page.dart';

// InputPage is a StatefulWidget responsible for capturing user input.
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

// _InputPageState is the state class for InputPage.
class _InputPageState extends State<InputPage> {
  // Initial values for user input
  double _sliderValue = 100.0; // Initial value for height
  bool _isMale = false; // Initial value boolean for gender
  int _weight = 50; // Initial value for weight

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Gender Selection Buttons
            Container(
              padding: EdgeInsets.all(50.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(0.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      // Male Button
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isMale = true;
                          });
                        },
                        child: Text('Male ♂', style: TextStyle(fontSize: 25.0)),
                        style: ElevatedButton.styleFrom(
                          primary: _isMale ? Colors.blue : null,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      // Female Button
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isMale = false;
                          });
                        },
                        child:
                            Text('Female ♀', style: TextStyle(fontSize: 25.0)),
                        style: ElevatedButton.styleFrom(
                          primary: !_isMale ? Colors.blue : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Height Slider
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(0.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // Slider for height input
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 200,
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                  ),
                  // Display the selected height
                  Text('Height: ${_sliderValue.round()} cm',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                ],
              ),
            ),
            // Weight Selection Buttons
            Container(
              padding: EdgeInsets.all(50.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(0.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20.0),
                  Row(
                    children: [
                      // Decrease Weight Button
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_weight > 0) {
                              _weight--;
                            }
                          });
                        },
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(width: 10.0),
                      // Display the selected weight
                      Text('Weight: $_weight kg',
                          style:
                              TextStyle(fontSize: 25.0, color: Colors.white)),
                      SizedBox(width: 10.0),
                      // Increase Weight Button
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _weight++;
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            // Calculate Button
            Container(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to ResultPage with user input data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        valueslider: _sliderValue,
                        gender: _isMale,
                        weight: _weight,
                      ),
                    ),
                  );
                },
                child: Text('CALCULATE', style: TextStyle(fontSize: 25.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
