class WeatherModel {
  late String date;
  late String name;
  late String imageOFWeather;
  late String nameOfWeather;
  late double temp;
  late double maxTemp;
  late double minTemp;

  WeatherModel({
    required this.date,
    required this.name,
    required this.imageOFWeather,
    required this.nameOfWeather,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
  });

  /// namedConstructor  && factory >> Method to avoid null & also namedConstructor
  factory WeatherModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return WeatherModel(
      name: json['location']['name'],
      date: json['location']['localtime'],
      imageOFWeather: json['current']['condition']['icon'],
      nameOfWeather: json['current']['condition']['text'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
  //will execute when use class / object
  // @override
  // String toString() {
  //   return 'data : temp = $temp date = $date';
  // }
}
