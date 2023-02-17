import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:weather_app/models/my_weather.dart';

import '../repository/weather_repo.dart';

class WeatherController {
  WeatherRepository weatherRepo = WeatherRepository();

  Future<MyWeatherModel> weatherByLatLonCtl(double lat, double lon) async {
    MyWeatherModel myWeather = MyWeatherModel();
    try {
      Response response = await weatherRepo.weatherByLatLonRepo(lat, lon);
      myWeather =
          MyWeatherModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    return myWeather;

  }

  Future<MyWeatherModel> weatherByCity(String cityName) async {
    MyWeatherModel myWeather = MyWeatherModel();
    try {
      Response response = await weatherRepo.weatherByCity(cityName);
      myWeather =
          MyWeatherModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    return myWeather;
  }
}
