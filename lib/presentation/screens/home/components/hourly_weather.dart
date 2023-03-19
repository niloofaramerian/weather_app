import 'package:flutter/material.dart';
import 'package:weather_app/data/utils/extensions/int_extension.dart';

import '../../../../data/models/weather.dart';
import '../../../resources/app_dimensions.dart';
import '../../../resources/app_text_theme.dart';
import '../../../widgets/weather_icon.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({Key? key, required this.items}) : super(key: key);

  final List<Hourly> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: SizedBox(
        height: 150,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: padding12,
                child: Column(
                  children: [
                    Text(
                      items[index].dt!.getFormattedTime,
                      style: bodyMedium,
                    ),
                    sizedBoxH8,
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: WeatherImage(
                          weatherName: items[index].weather![0].main!),
                    ),
                    sizedBoxH8,
                    Text(
                      items[index].weather![0].main!,
                      style: headlineSmall,
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: items.length,
          separatorBuilder: (context, index) => sizedBoxW8,
        ),
      ),
    );
  }
}
