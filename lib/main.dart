import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 8, 15, 146),
        scaffoldBackgroundColor: Color.fromARGB(255, 80, 89, 255),
      ),
      home: InputPage(),
    );
  }
}
