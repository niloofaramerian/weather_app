import 'package:flutter/material.dart';
import 'package:weather_app/presentation/resources/app_text_theme.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/empty_state/search_result.png',
          width: MediaQuery.of(context).size.width / 1.2,
          fit: BoxFit.fill,
        ),
        const Text(
          'Search city name',
          style: bodyLarge,
        ),
      ],
    );
  }
}
