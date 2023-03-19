import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../data/models/weather.dart';
import '../../../data/repository/weather_repository.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required this.repository}) : super(WeatherInitial()) {
    on<FetchCurrentPositionWeather>(
      _fetchCurrentPositionWeather,
    );
  }

  final WeatherRepository repository;

  Future<void> _fetchCurrentPositionWeather(
    FetchCurrentPositionWeather event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      final response = await repository.fetchWeather(position: event.position);
      emit(WeatherSuccess(response));
    } catch (e) {
      emit(WeatherFailure('$e'));
    }
  }
}
