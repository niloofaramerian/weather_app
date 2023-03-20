part of 'search_weather_bloc.dart';

@immutable
abstract class SearchWeatherState {}

class SearchWeatherInitial extends SearchWeatherState {}

class SearchWeatherLoading extends SearchWeatherState {}

class SearchWeatherSuccess extends SearchWeatherState {
  final SearchWeatherModel response;

  SearchWeatherSuccess({required this.response});
}

class SearchWeatherFailure extends SearchWeatherState {
  final String error;

  SearchWeatherFailure({required this.error});
}
