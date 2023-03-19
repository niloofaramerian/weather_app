import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class WeatherProvider {
  WeatherProvider._();

  static final _instance = WeatherProvider._();

  factory WeatherProvider() => _instance;

  final apiKey = 'ed60fcfbd110ee65c7150605ea8aceea';

  Future<Response> fetchWeather({required Position position}) async {
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
}
