import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/util/convert_icon.dart';
import 'package:weather_forecast_app/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data!.list;
  var formattedDate = Util.getFormattedDate(
      new DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000));
  var dayOfWeek = formattedDate.split(",")[0]; //[Saturday,Dec 14,2019]
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 33,
            child: getWeatherIcon(
                forecastList[0].weather![0].main!, Colors.pinkAccent, 45),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${forecastList[index].temp!.min!.toStringAsFixed(0)} °F"),
                  ),
                  Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    color: Colors.white,
                    size: 17,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "${forecastList[index].temp!.max!.toStringAsFixed(0)} °F"),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleUp,
                      color: Colors.white,
                      size: 17,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Hum:${forecastList[index].humidity!.toStringAsFixed(0)} %"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Win:${forecastList[index].speed!.toStringAsFixed(1)} mi/h"),
              )
            ],
          )
        ],
      ),
    ],
  );
}
