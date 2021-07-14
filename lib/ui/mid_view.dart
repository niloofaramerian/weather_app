import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data!.list;
  var city = snapshot.data!.city!.name;
  var country = snapshot.data!.city!.country;
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$city, $country",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black
            ),
          ),
        ],
      ),
    ),
  );
  return midView;
}
