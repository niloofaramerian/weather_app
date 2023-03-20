part of 'search_weather_bloc.dart';

@immutable
abstract class SearchWeatherEvent {}

class SubmitSearch extends SearchWeatherEvent {
  final String city;

  SubmitSearch({required this.city});
}
