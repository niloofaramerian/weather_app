import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/util/forecast_util.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({String? cityName}) async {
    /// final => val
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q=" +
        cityName! +
        "&appid=" +
        Util.appId +
        "&units=imperial"; //change to metric or imperial

    final response = await get(Uri.parse(finalUrl));

    if (response.statusCode == 200) {
      // we get the actual mapped model ( dart object )
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}
