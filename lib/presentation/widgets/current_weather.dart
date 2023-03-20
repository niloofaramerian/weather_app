import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/models/daily_weather.dart';

import '../resources/app_colors.dart';
import '../resources/app_dimensions.dart';
import '../resources/app_text_theme.dart';
import 'weather_icon.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    Key? key,
    required this.weather,
    this.showWindInfo = true,
  }) : super(key: key);

  final DailyWeather weather;
  final bool showWindInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Padding(
        padding: padding12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: paddingH12,
              child: Text(
                DateFormat.yMMMEd().add_jm().format(DateTime.now()),
                style: bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            sizedBoxH12,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${weather.temp!.day!.toStringAsFixed(0)} °C',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            letterSpacing: .5,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      sizedBoxH12,
                      Text(
                        weather.weather![0].main!,
                        style: headlineLarge,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: WeatherImage(weatherName: weather.weather![0].main!),
                ),
              ],
            ),
            sizedBoxH12,
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  showWindInfo ?
                  _WeatherInfo(
                    iconData: CupertinoIcons.wind,
                    title: 'wind',
                    subTitle: '${weather.windSpeed?.round()} m/s',
                  ) : _WeatherInfo(
                    iconData: Icons.timer_outlined,
                    title: 'Pressure',
                    subTitle: '${weather.pressure?.round()} hPa',
                  ),
                  const VerticalDivider(),
                  _WeatherInfo(
                    iconData: Icons.water_drop_outlined,
                    title: 'Humidity',
                    subTitle: '${weather.humidity?.round()} %',
                  ),
                  const VerticalDivider(),
                  _WeatherInfo(
                    iconData: CupertinoIcons.cloud_rain,
                    title: 'Rain',
                    subTitle: '${weather.rain?.round()} mm/h',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _WeatherInfo extends StatelessWidget {
  const _WeatherInfo({
    Key? key,
    required this.iconData,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final IconData iconData;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          color: AppColors.icon,
          size: 20,
        ),
        sizedBoxH4,
        Text(subTitle, style: headlineSmall),
        sizedBoxH4,
        Text(title, style: bodySmall)
      ],
    );
  }
}
