import 'package:flutter/material.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/network/network.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {

  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Mumbai";

  @override
  void initState() {
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
    /// when we print forecastObject because it type is futureType is may be initialize or not
    /// and we use then that say when it initialize then print.
    forecastObject.then((value) => {
      print(value.city)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forecast"),
      ),
    );
  }
}
