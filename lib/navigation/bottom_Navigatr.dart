// ignore_for_file: unnecessary_const
import "package:flutter/material.dart";

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        switch (index) {
          case 0 : 
            Navigator.pushNamed(context, '/');
            break;
          case 1 : 
            Navigator.pushNamed(context, '/Bmi');
            break;
          default:
        }
      },
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.monitor_weight), label: "BMI"),
    ],
    );
  }
}
