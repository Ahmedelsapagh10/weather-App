import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/HomeScreen/provider/weather_model.dart';
import 'package:weather_app/constant.dart';

class WeatherApi {
  Future<WeatherModel?> getData({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=${API_KEY}&q=${cityName}&days=5');

      //get need Uri >>so i will get Object ^^
      http.Response response = await http.get(url);
      //convert data that recived to json view
      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e.toString());
    }
    return weather;
  }
}
