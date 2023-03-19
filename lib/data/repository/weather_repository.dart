import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weather.dart';
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

  Future<WeatherModel> fetchWeather({required Position position}) async {
    try {
      final response = await provider.fetchWeather(position: position);
      return WeatherModel.fromJson(response.data);
    } on DioError catch (e) {
      throw DioExceptions.fromDioError(e).toString();
    }
  }
}
