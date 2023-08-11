import "package:flutter/material.dart";
import "package:flutter_application_1/data/weather.dart";
import "package:flutter_application_1/navigation/bottom_Navigatr.dart";
import "package:flutter_application_1/navigation/menu_Drawer.dart";
import "../data/http_Helper.dart";

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather('', '', 0, 0, 0, 0);
  TextEditingController txtPlace = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Weather")),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const BottomNav(),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextField(
              controller: txtPlace,
              decoration: InputDecoration(
                  hintText: "Enter your location",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: getData,
                  )),
            ),
            weatherRow("Place:", result.name),
            weatherRow("Description:", result.description),
            weatherRow("Tempeature:", result.temperature.toStringAsFixed(2)),
            weatherRow("Percived:", result.percieved.toStringAsFixed(2)),
            weatherRow("Humidity:", result.humidity.toString()),
            weatherRow("Pressure:", result.pressure.toString()),
          ],
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

// the weatherRow widget is just like a reusable component in react, it holds the key_value pair data that is shown to the user
// Model classes are used to represent and organize data, making it easier to work with, manipulate, and display in your Flutter app. 
  Widget weatherRow(String label, String value){
    Widget row = Padding(padding: const EdgeInsets.symmetric(vertical: 18), // this is a custom widget, you can tell because it is starting with a small letter
     child: Row( // render items in a row so in this case the label and the value are in a row
       children: [
        Expanded(
           flex: 3,
          child: Text(label, style: TextStyle(fontSize: 20, color: Theme.of(context).hintColor)),
        ),
        Expanded(
           flex: 4,
          child: Text(value, style: TextStyle(fontSize: 20, color: Theme.of(context).hintColor)),
        )
       ],
     ),
    );

    return row;
  }

  
}
