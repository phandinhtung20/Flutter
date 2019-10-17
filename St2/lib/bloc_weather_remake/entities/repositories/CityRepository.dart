import 'package:study_app/bloc_weather_remake/constants/Constants.dart';
import 'package:study_app/bloc_weather_remake/entities/City.dart';
import 'package:study_app/bloc_weather_remake/utils/HttpClient.dart';

class CityRepository {
  City _city;
  static CityRepository _cityRepository;

  Future<City> getCity(String cityName) async {
    final locationUrl = '${Constant.baseUrl}/api/location/search/?query=$cityName';
    final locationResponse = await HttpClient.getInstance().getClient().get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    _city = City.fromJson(locationResponse.body);

    return this._city;
  }

  City get city => this._city;

  static CityRepository getInstance() {
    if (_cityRepository == null) {
      _cityRepository = new CityRepository();
    }

    return _cityRepository;
  }
}