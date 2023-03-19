import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/data/utils/extensions/int_extension.dart';

import '../../../../data/models/weather.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_dimensions.dart';
import '../../../resources/app_text_theme.dart';
import '../../../widgets/weather_icon.dart';

class DailyWeather extends StatelessWidget {
  const DailyWeather({Key? key, required this.items}) : super(key: key);

  final List<Daily> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((daily) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          padding: padding12,
          decoration: BoxDecoration(
            color: AppColors.icon.withOpacity(0.02),
            borderRadius: borderRadius20,
            border: Border.all(color: AppColors.outline, width: 0.1),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: WeatherImage(weatherName: daily.weather![0].main!),
              ),
              sizedBoxW12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        daily.dt!.getFormattedDate,
                        style: headlineMedium,
                      ),
                    ),
                    sizedBoxH12,
                    Text(
                      daily.weather![0].main!,
                      style: bodyLarge,
                    ),
                  ],
                ),
              ),
              Text(
                '${daily.temp!.day!.toStringAsFixed(0)} °c',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    letterSpacing: .5,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
