import 'package:flutter/material.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/util/convert_icon.dart';
import 'package:weather_forecast_app/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index){
  var forecastList = snapshot.data!.list;
  var formattedDate = Util.getFormattedDate(
      new DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000)
  );
  var dayOfWeek = formattedDate.split(",")[0];  //[Saturday,Dec 14,2019]
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 33,
            child: getWeatherIcon(forecastList[0].weather![0].main!, Colors.pinkAccent, 45),
          )
        ],
      ),


    ],

  );
}