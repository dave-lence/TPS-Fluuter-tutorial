import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/BMI_Screen.dart';
import 'package:flutter_application_1/screens/Intro_Screen.dart';

void main() {
  runApp(const GlobalApp());
}

class GlobalApp extends StatelessWidget {
  const GlobalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        "/": (context) => const IntroScreen(),
        "/Bmi": (context) => const BmiScreen(),
      },
      initialRoute: "/",
    );
  }
}
