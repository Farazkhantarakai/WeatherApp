import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';

class ApiService extends GetxController {
  Future<weather> getWeather(lat, long) async {
    if (kDebugMode) {
      print('$lat and $long');
    }
    late weather data;
    String url =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&exclude=minutely&units=metric&appid=b35d50c55fa1d866e663e97be46c013a';
    var response = await http.get(Uri.parse(url));
    var result = jsonDecode(response.body);
    // print(result);
    if (kDebugMode) {
      print(result);
    }
    if (response.statusCode == 200) {
      data = weather.fromJson(result);
    }
    return data;
  }
}
