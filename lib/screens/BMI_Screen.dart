import "package:flutter/material.dart";
import 'package:flutter_application_1/navigation/bottom_Navigatr.dart';
import 'package:flutter_application_1/navigation/menu_Drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key); // this is the constructor of the widget class (BmiScreen class). The key is a unique i dentifier for the widget, The super(key: key) calls the constructor of the parent class, which in this case is StatelessWidget

  @override
  State<BmiScreen> createState() => _BmiScreenState(); // this is the create state method required by the stateful widget, it is used to create an instance of the state
}

class _BmiScreenState extends State<BmiScreen> {
  TextEditingController txtHeight = TextEditingController(); // Text-editing-controller contols the value in the text input
  TextEditingController txtWeight = TextEditingController();

  final double fontSize = 18; //final is used to set var that is final and its state wont be udated

  String weightLabel = "";
  String heightLabel = "";
  String result = '';

  bool isMetric = true;
  bool isImperial = false;

  double? height;
  double? weight; // double is a data type that is used to store floating point numbers, it holds numbers with decimals
  late List<bool> isSelected;

  @override
  void initState() {
    // TODO: implement initState
    isSelected = [isMetric, isImperial]; // initilizing state if toggle button
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // the build method is basically the method that builds the UI
    heightLabel =
        "Please insert your height in ${(isMetric) ? "meters" : "height"}";
    weightLabel =
        "Please enter your weight in ${(isImperial) ? "kilos" : "pounds"}";

    return Scaffold( // scafold widgets holds differents type of widget
        appBar: AppBar(title: const Text("BMI Calculator")),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const BottomNav(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleButtons(
                  // ignore: sort_child_properties_last
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Metric", style: TextStyle(fontSize: fontSize)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:
                          Text("Imperial", style: TextStyle(fontSize: fontSize)),
                    )
                  ], isSelected: isSelected, onPressed: toggleBtn),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextField(
                controller: txtHeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: heightLabel),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextField(
                  controller: txtWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: weightLabel)),
            ),
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: ElevatedButton(
                onPressed: findBmi,
                child:  Text(
                  ' Calculate BMI',
                  style:  TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
            Text(
              result,
              style: TextStyle(fontSize: fontSize),
            ),
          ],
        ));
  }

 //void is just like a function decleration
  void toggleBtn(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial]; // set state here sets the state of the toggle button
    });
  }

  void findBmi() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    //set state here is setting the state of the result
    setState(() {
      result = "Your BMI is " + bmi.toStringAsFixed(2);
    });
  }
}
