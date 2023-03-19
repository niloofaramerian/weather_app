part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class FetchCurrentPositionWeather extends WeatherEvent {
  final Position position;

  FetchCurrentPositionWeather(this.position);
}
