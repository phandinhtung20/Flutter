import 'dart:async';
import 'package:meta/meta.dart';
import 'package:study_app/bloc_weather/utils/WeatherApiClient.dart';

import 'Weather.dart';


class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return await weatherApiClient.fetchWeather(locationId);
  }
}