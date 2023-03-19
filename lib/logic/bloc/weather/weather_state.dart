part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class WeatherSuccess extends WeatherState {
  final WeatherModel response;

  WeatherSuccess(this.response);
}
class WeatherFailure extends WeatherState {
  final String error;

  WeatherFailure(this.error);
}
