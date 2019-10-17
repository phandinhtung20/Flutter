import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:study_app/bloc_weather/blocs/WeaetherState.dart';
import 'package:study_app/bloc_weather/blocs/WeatherEvent.dart';
import 'package:study_app/bloc_weather/entities/Weather.dart';
import 'package:study_app/bloc_weather/entities/WeatherRepository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoaded(weather: weather);
      } catch (_) {
        yield WeatherError();
      }
    }

    if (event is RefreshWeather) {
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoaded(weather: weather);
      } catch (_) {
        yield currentState;
      }
    }
  }
}