// This file is an example of model class that holds the object of the session
class Session {
  int id = 0;
  String date = "";
  String description = "";
  int duration = 0;

  // nameless constructor that holds the value of the above object
  Session(this.id, this.date, this.description, this.duration);
 
  // named constructor that takes a map method and convert the data passed as an argument from json object to sessionMap in dart
  Session.fromJson(Map<String, dynamic> sessionMap){
    id = sessionMap["id"] ?? 0;
    date = sessionMap["date"] ?? '';
    description = sessionMap["description"] ?? '';
    duration = sessionMap["duration"] ?? 0;
  }


  ////yet another constructor to change the sessionMap data back to json map data format when the user wants to update the training data
  Map<String, dynamic> toJson(){
    return {
      "id" : id,
      "date" : date,
      "description" : description,
      "duration" : duration,
    };
  }
}