import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/search_weather.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

part 'search_weather_event.dart';

part 'search_weather_state.dart';

class SearchWeatherBloc extends Bloc<SearchWeatherEvent, SearchWeatherState> {
  SearchWeatherBloc({required this.repository})
      : super(SearchWeatherInitial()) {
    on<SubmitSearch>(
      _submitSearch,
      transformer: restartable(),
    );
  }

  final WeatherRepository repository;

  Future<void> _submitSearch(
      SubmitSearch event, Emitter<SearchWeatherState> emit) async {
    emit(SearchWeatherLoading());
    try {
      final response = await repository.searchWeather(city: event.city);
      emit(SearchWeatherSuccess(response: response));
    } catch (e) {
      emit(SearchWeatherFailure(error: '$e'));
    }
  }
}
