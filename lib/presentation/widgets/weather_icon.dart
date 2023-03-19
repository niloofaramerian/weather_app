import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  WeatherImage({Key? key, required this.weatherName}) : super(key: key);

  final String weatherName;

  final _imageMap = {
    'Clear': 'images/clear_sky.png',
    'few clouds': 'images/few_clouds.png',
    'Clouds': 'images/scattered_clouds.png',
    'broken clouds': 'images/broken_clouds.png',
    'shower rain': 'images/shower_rain.png',
    'Rain': 'images/rain.png',
    'thunderstorm': 'images/thunderstorm.png',
    'Snow': 'images/snow.png',
    'mist': 'images/mist.png',
  };

  @override
  Widget build(BuildContext context) {
    return Image.asset(_imageMap[weatherName]!);
  }
}
