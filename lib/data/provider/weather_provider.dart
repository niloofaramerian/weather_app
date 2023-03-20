import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class WeatherProvider {
  WeatherProvider._();

  static final _instance = WeatherProvider._();

  factory WeatherProvider() => _instance;

  final apiKey = 'Paste Your API Key Here';

  Future<Response> fetchCurrentLocationWeather(
      {required Position position}) async {
    try {
      final response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/onecall',
        queryParameters: {
          'lat': position.latitude,
          'lon': position.longitude,
          'units': 'metric',
          'exclude': 'minutely,current',
          'appid': apiKey
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> searchWeather({required String city}) async {
    try {
      final response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/forecast/daily',
        queryParameters: {'q': city, 'appid': apiKey},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
