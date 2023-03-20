import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../models/search_weather.dart';
import '../models/current_location_weather.dart';
import '../provider/base/dio_exception.dart';
import '../provider/weather_provider.dart';

class WeatherRepository {
  WeatherRepository._();

  static final _instance = WeatherRepository._();

  late WeatherProvider provider;

  factory WeatherRepository({required WeatherProvider provider}) {
    _instance.provider = provider;
    return _instance;
  }

  Future<CurrentLocationWeather> fetchCurrentLocationWeather({
    required Position position,
  }) async {
    try {
      final response =
          await provider.fetchCurrentLocationWeather(position: position);
      return CurrentLocationWeather.fromJson(response.data);
    } on DioError catch (e) {
      throw DioExceptions.fromDioError(e).toString();
    }
  }

  Future<SearchWeatherModel> searchWeather({required String city}) async {
    try {
      final response = await provider.searchWeather(city: city);
      return SearchWeatherModel.fromJson(response.data);
    } on DioError catch (e) {
      throw DioExceptions.fromDioError(e).toString();
    }
  }
}
