import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/bloc/search_weather/search_weather_bloc.dart';
import '../../../resources/app_dimensions.dart';
import '../../../resources/app_icons.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding12,
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          prefixIcon: searchIcon,
          hintText: 'Search city name',
        ),
        onSubmitted: (value) {
          context.read<SearchWeatherBloc>().add(SubmitSearch(city: value));
        },
      ),
    );
  }
}
