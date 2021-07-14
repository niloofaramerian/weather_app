import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data!.list;
  var city = snapshot.data!.city!.name;
  var country = snapshot.data!.city!.country;
  var formattedDate =
      new DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$city, $country",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Text(
            "${Util.getFormattedDate(formattedDate)}",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 10),
          Icon(
            Icons.wb_sunny,
            size: 195,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${forecastList![0]!.temp!.day!.toStringAsFixed(0)} °F",
                  style: TextStyle(
                    fontSize: 34,
                  ),
                ),
                Text(
                    "${forecastList![0]!.weather![0].description!.toUpperCase()}"),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "${forecastList![0]!.speed!.toStringAsFixed(1)} mi/h"),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.brown,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "${forecastList![0]!.humidity!.toStringAsFixed(0)} %"),
                      Icon(
                        Icons.hot_tub,
                        size: 20,
                        color: Colors.brown,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastList![0]!.temp!.max} °F"),
                      Icon(
                        Icons.wb_sunny,
                        size: 20,
                        color: Colors.brown,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
  return midView;
}
