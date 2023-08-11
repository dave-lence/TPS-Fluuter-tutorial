import 'package:shared_preferences/shared_preferences.dart';
import "session.dart";
import "dart:convert"; // this can change a string into map object and back


// this class is to serve as an interface between the code and sharedPreferences
class SPHelper{
  static late SharedPreferences prefs;

    //In Flutter, a Future represents a potential value or error that will be available at some time in the future. It's used to work with asynchronous operations, such as fetching data from a network, reading files, or performing other tasks that might take some time to complete.

  Future init() async{
    prefs = await SharedPreferences.getInstance(); // getting the instance of sharedPreferences
  }

    // this method writes or set data into our sharedPreferences (AsyncStorage in react)
  Future writeSession(Session session) async {
    // key must be a string    // sessionMap converted to string
   prefs.setString(session.id.toString(), json.encode(session.toJson())); // sharedPreferences cant take an object as an argument thats why its converted  to json string with json.encode and back to and object with session.toJson
  }
}