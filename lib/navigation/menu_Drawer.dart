// ignore_for_file: unnecessary_const

import "package:flutter/material.dart";
import 'package:flutter_application_1/screens/BMI_Screen.dart';
import 'package:flutter_application_1/screens/Intro_Screen.dart';
import 'package:flutter_application_1/screens/Weather_Screen.dart';

class MenuDrawer extends StatelessWidget {
  //stateless widget are widget whos state does not change through out its life time
  const MenuDrawer({Key? key})
      : super(
            key:
                key); // this is the constructor of the widget class (MenuDrawer class). The key is a unique i dentifier for the widget, The super(key: key) calls the constructor of the parent class, which in this case is StatelessWidget

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      "Home",
      "BMI Calculator",
      "Weather",
      "Training"
    ];

    List<Widget> menuItems = [];

    menuItems.add(const DrawerHeader(
        decoration: const BoxDecoration(color: Colors.blueGrey),
        child: const Text(
          "Globo Fitness",
          style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1), fontSize: 24),
        )));

    // ignore: avoid_function_literals_in_foreach_calls
    menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(
          element,
          style: const TextStyle(fontSize: 18),
        ),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = const IntroScreen();
              break;
            case "BMI Calculator":
              screen = const BmiScreen();
              break;
            case "Weather":
              screen = const WeatherScreen();
              break;
            default:
          }
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    });
    return menuItems;
  }
}
