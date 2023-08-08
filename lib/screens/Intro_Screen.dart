import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation/bottom_Navigatr.dart';
import 'package:flutter_application_1/navigation/menu_Drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text("Globo Fitness")),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomNav(),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('../assets/jog.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
            child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Text(
                  "Globo fitness is good for your health",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20, shadows: [
                    Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.black87)
                  ]),
                ))),
      ),
    );
  }
}

