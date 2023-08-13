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

  // funtion that returns a list of session from the sharedPreferences
  List<Session> getSessions() {
     List<Session> sessions = [];
     Set<String> keys = prefs.getKeys();
      keys.forEach((String key) {
        if(key != "counter"){
        Session session = Session.fromJson(jsonDecode(prefs.getString(key) ?? ""));
        sessions.add(session);
        }
       });

       return sessions;
  }

  
// this function handles the id increament for us
  Future setIdCounter() async{
    int counter = prefs.getInt("counter") ?? 0;
    counter++;
    await prefs.setInt("counter", counter);
  }

  // this function help us get the id crount from sharedPreferences
  int getIdCounter(){
   return prefs.getInt("counter") ?? 0;
  }

   //function to delete a training session
   Future deleteSession(int id) async{
    return prefs.remove(id.toString());
   }
}