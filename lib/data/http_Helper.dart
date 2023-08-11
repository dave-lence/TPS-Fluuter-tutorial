import 'package:http/http.dart' as http;
import 'dart:convert';
import './weather.dart';

class HttpHelper{
  // https://api.openweathermap.org/data/2.5/weather?q=london&appid=045cf6a45ff9821008b76e81a6c300f9
  final authority = "api.openweathermap.org";
  final path = "data/2.5/weather";
  final apiKey = "045cf6a45ff9821008b76e81a6c300f9";

  Future <Weather> getWeather(String location) async{ // you can use the Future keyword to perform async task like calling data from an api or data that would load sometime in the futre of the app
    Map<String, dynamic> params = {"q" : location, "appID" : apiKey}; // the map methos is just like creating an object in javascript
    Uri weatherUri = Uri.https(authority, path, params);
    http.Response result = await http.get(weatherUri);
    Map <String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}