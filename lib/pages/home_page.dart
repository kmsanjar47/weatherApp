import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/models/my_weather.dart';
import 'package:weather_app/pages/city_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../models/content_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyWeatherModel? weatherData;
  bool? isLoading;
  List myItems = [];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    isLoading = true;

    getLatLon();
  }

  Position? position;

  getLatLon() async {
    try {
      position = await Geolocator.getCurrentPosition();
      double latitude = position!.latitude;
      double longitude = position!.longitude;

      setState(() {
        getWeatherByLatLon(latitude, longitude);
        isLoading = false;
      });
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  getWeatherByLatLon(double lat, double lon) async {
    WeatherController weatherController = WeatherController();
    MyWeatherModel weatherModel =
        await weatherController.weatherByLatLonCtl(lat, lon);
    if (weatherModel.cod == 200) {
      setState(() {
        weatherData = weatherModel;
        myItems = [
          ["FEELS LIKE", weatherData!.main!.feelsLike, "feels_like.png"],
          ["TEMP MIN", weatherData!.main!.tempMin, "low-temperature.png"],
          ["TEMP MAX", weatherData!.main!.tempMax, "high-temperature.png"],
          ["PRESSURE", weatherData!.main!.pressure, "pressure.png"],
          ["HUMIDITY", weatherData!.main!.humidity, "humidity.png"],
          ["WIND SPEED", weatherData!.wind!.speed, "wind.png"]
        ];
        isLoading = false;
      });
    } else {
      if (kDebugMode) {
        print("error");
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  getWeatherByCity(String cityName) async {
    WeatherController weatherController = WeatherController();
    MyWeatherModel weatherModel =
        await weatherController.weatherByCity(cityName);
    if (weatherModel.cod == 200) {
      setState(() {
        weatherData = weatherModel;
        myItems = [
          ["FEELS LIKE", weatherData!.main!.feelsLike, "feels_like.png"],
          ["TEMP MIN", weatherData!.main!.tempMin, "low-temperature.png"],
          ["TEMP MAX", weatherData!.main!.tempMax, "high-temperature.png"],
          ["PRESSURE", weatherData!.main!.pressure, "pressure.png"],
          ["HUMIDITY", weatherData!.main!.humidity, "humidity.png"],
          ["WIND SPEED", weatherData!.wind!.speed, "wind.png"]
        ];
        isLoading = false;
      });
    } else if (weatherModel.cod == "404") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("City Not Found"),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } else {
      if (kDebugMode) {
        print("error");
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isLoading == false && weatherData != null
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            getLatLon();
                          },
                          child: const Icon(
                            CupertinoIcons.location,
                            size: 35,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            String? cityName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CityPage(),
                              ),
                            );
                            setState(() {
                              isLoading = true;
                            });
                            getWeatherByCity(cityName!);
                          },
                          child: const Icon(
                            Icons.location_city,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    weatherData!.name!,
                    style: const TextStyle(fontSize: 50),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                    "https://openweathermap.org/img/wn/${weatherData!.weather![0].icon!}@2x.png",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${weatherData!.main!.temp!}°",
                    style: const TextStyle(fontSize: 50),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    weatherData!.weather![0].main!,
                    style: const TextStyle(fontSize: 50),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: CarouselSlider.builder(
                      itemCount: myItems.length,
                      itemBuilder: (context, index, startIndex) {
                        return ContentBox(
                          title: myItems[index][0],
                          value: myItems[index][1],
                          myIcon: myItems[index][2],
                        );
                      },
                      options: CarouselOptions(
                        initialPage: 0,
                        autoPlay: true,
                        aspectRatio: 1,
                        scrollDirection: Axis.horizontal,
                        enlargeCenterPage: true,
                        autoPlayInterval: const Duration(seconds: 10),
                      ),
                    ),
                  )
                ],
              )
            : const CircularProgressIndicator());
  }
}
