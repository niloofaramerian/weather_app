import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/weather_repository.dart';
import '../../../logic/bloc/weather/weather_bloc.dart';
import '../../../logic/cubit/position/position_cubit.dart';
import '../../resources/app_dimensions.dart';
import '../../resources/app_icons.dart';
import '../../resources/app_text_theme.dart';
import '../../widgets/ball_spin_fade_loading.dart';
import '../../widgets/failure.dart';
import 'components/current_weather.dart';
import 'components/daily_weather.dart';
import 'components/hourly_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PositionCubit()..determinePosition()),
        BlocProvider(
          create: (_) => WeatherBloc(
            repository: context.read<WeatherRepository>(),
          ),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          sizedBoxH12,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              locationIcon,
              sizedBoxW8,
              Text('Your Current Location', style: bodyMedium)
            ],
          ),
          sizedBoxH12,
          BlocBuilder<PositionCubit, PositionState>(
            builder: (context, state) {
              if (state is PositionSuccess) {
                // Fetch weather forecast
                context
                    .read<WeatherBloc>()
                    .add(FetchCurrentPositionWeather(state.position));

                return const _WeatherForecast();
              }
              if (state is PositionFailure) {
                return Failure(
                  message: state.error,
                  onPress: () => _determinePosition(context),
                );
              }
              return const BallSpinFadeLoading();
            },
          ),
        ],
      ),
    );
  }
}

class _WeatherForecast extends StatelessWidget {
  const _WeatherForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return Expanded(
            child: ListView(
              children: [
                Text(
                  state.response.timezone ?? '',
                  style: headlineMedium,
                  textAlign: TextAlign.center,
                ),
                sizedBoxH12,
                CurrentWeather(weather: state.response.daily![0]),
                sizedBoxH24,
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text('Today', style: headlineLarge),
                ),
                sizedBoxH8,
                HourlyWeather(
                  items: state.response.hourly!,
                ),
                sizedBoxH24,
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text('Next 7 days', style: headlineLarge),
                ),
                sizedBoxH8,
                DailyWeather(items: state.response.daily!.sublist(1, 8)),
                sizedBoxH60,
              ],
            ),
          );
        }
        if (state is WeatherFailure) {
          return Failure(
            message: state.error,
            onPress: () => _determinePosition(context),
          );
        }
        return const BallSpinFadeLoading();
      },
    );
  }
}

void _determinePosition(BuildContext context) =>
    context.read<PositionCubit>().determinePosition();
