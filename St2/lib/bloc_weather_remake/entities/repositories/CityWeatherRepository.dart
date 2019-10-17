import 'package:study_app/bloc_weather_remake/constants/Constants.dart';
import 'package:study_app/bloc_weather_remake/entities/City.dart';
import 'package:study_app/bloc_weather_remake/entities/CityWeather.dart';
import 'package:study_app/bloc_weather_remake/utils/HttpClient.dart';

class CityWeatherRepository {
  CityWeather _cityWeather;
  static CityWeatherRepository _cityWeatherRepository;

  Future<CityWeather> getCity(City city) async {
    final locationUrl = '${Constant.baseUrl}/api/location/${city.getId().toString()}';
    final locationResponse = await HttpClient.getInstance().getClient().get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    _cityWeather = CityWeather.fromJson(locationResponse.body);
    return this._cityWeather;
  }

  CityWeather get cityWeather => this._cityWeather;

  static CityWeatherRepository getInstance() {
    if (_cityWeatherRepository == null) {
      _cityWeatherRepository = new CityWeatherRepository();
    }

    return _cityWeatherRepository;
  }
}