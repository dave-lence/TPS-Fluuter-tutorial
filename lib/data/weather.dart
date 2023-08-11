// this whole file is an example of a model class
class Weather {
  // these are datas that would be shown to the user
  String name = '';
  String description = '';
  double temperature = 0;
  double percieved = 0;
  int pressure = 0;
  int humidity = 0;

// here we are creating a constructor that set all the above data when called
  Weather(this.name, this.description, this.humidity, this.percieved,
      this.pressure, this.temperature);

 // create another constructor that would take the key-vaues pairs of the field as a paramter   
  Weather.fromJson(Map<String, dynamic> weatherMap)  {
    this.name = weatherMap['name'];
    this.temperature = (weatherMap['main']['temp'] - 273.15) ?? 0;
    this.percieved = (weatherMap['main']['feels_like'] - 273.15) ?? 0;
    this.pressure = weatherMap['main']['pressure'] ?? 0;
    this.humidity = weatherMap['main']['himidity'] ?? 0;
    this.description = weatherMap['weather'][0]['main'] ?? '';
  }
}
