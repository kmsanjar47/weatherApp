import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WeatherRepository {

  Future<Response> weatherByLatLonRepo(double lat, double lon) async {
    Response response = await Client().get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=00bce33aaf39cbe521482ca84368bf85&units=metric"));
    return response;
  }

  Future<Response> weatherByCity(String city) async {
    Response response = await Client().get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=00bce33aaf39cbe521482ca84368bf85&units=metric"));
    return response;
  }
}
