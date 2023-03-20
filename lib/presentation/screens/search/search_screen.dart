import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/weather_repository.dart';
import '../../../logic/bloc/search_weather/search_weather_bloc.dart';
import '../../resources/app_dimensions.dart';
import '../../resources/app_icons.dart';
import '../../resources/app_text_theme.dart';
import '../../widgets/ball_spin_fade_loading.dart';
import '../../widgets/current_weather.dart';
import '../../widgets/daily_weathers.dart';
import '../../widgets/failure.dart';
import 'components/empty_search.dart';
import 'components/not_found.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchWeatherBloc(
        repository: context.read<WeatherRepository>(),
      ),
      child: Column(
        children: [
          Padding(
            padding: padding12,
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                prefixIcon: searchIcon,
                hintText: 'Search city name',
              ),
              onSubmitted: (value) => _search(),
            ),
          ),
          BlocBuilder<SearchWeatherBloc, SearchWeatherState>(
              builder: (context, state) {
            if (state is SearchWeatherLoading) {
              return const BallSpinFadeLoading();
            }
            if (state is SearchWeatherSuccess) {
              return Expanded(
                child: ListView(
                  children: [
                    Text(
                      '${state.response.city!.name}, ${state.response.city!.country}',
                      style: headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    sizedBoxH12,
                    CurrentWeather(
                      weather: state.response.list![0],
                      showWindInfo: false,
                    ),
                    sizedBoxH24,
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text('Next 7 days', style: headlineLarge),
                    ),
                    sizedBoxH8,
                    DailyWeathers(items: state.response.list!),
                    sizedBoxH60,
                  ],
                ),
              );
            }
            if (state is SearchWeatherFailure) {
              return state.error.contains('not found')
                  ? const NotFound()
                  : Failure(message: state.error, onPress: () => _search());
            }

            return const EmptySearch();
          }),
        ],
      ),
    );
  }

  void _search() => context
      .read<SearchWeatherBloc>()
      .add(SubmitSearch(city: controller.text));

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
