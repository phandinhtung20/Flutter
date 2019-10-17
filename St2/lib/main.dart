import 'package:flutter/material.dart';
import 'package:study_app/Onboarding/mainPage2.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData.dark(),
        title: 'Flutter Weather',
        debugShowCheckedModeBanner: false,
        home: MyOnBoarding()
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:study_app/bloc_weather_remake/entities/City.dart';
import 'package:study_app/bloc_weather_remake/entities/CityWeather.dart';
import 'package:study_app/bloc_weather_remake/entities/repositories/CityRepository.dart';
import 'package:study_app/bloc_weather_remake/entities/repositories/CityWeatherRepository.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _city = CityRepository.getInstance().getCity('London');
    _city.then((data) {
      print(data.toString());
      Future <CityWeather>_cityWeather = CityWeatherRepository.getInstance().getCity(data);
      _cityWeather.then((w) {
        print(w);
      });
    });

    return MaterialApp(
      darkTheme: ThemeData.dark(),
      title: 'Flutter Weather',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Weather'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder(
              future: _city,
              builder: (context, snapshot) {
                return FutureBuilder(
                    future: CityWeatherRepository.getInstance().getCity(snapshot.data),
                    builder: (context, snapshot) {
                      return Text(snapshot.data.toString());
                    }
                );
              }
          )
        ),
      )
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/bloc_login_remake/blocs/AuthenticationBloc.dart';
import 'package:study_app/bloc_login_remake/blocs/AuthenticationEvent.dart';
import 'package:study_app/bloc_login_remake/blocs/AuthenticationState.dart';
import 'package:study_app/bloc_login_remake/pages/LoadingIndicator.dart';
import 'package:study_app/bloc_login_remake/pages/SplashPage.dart';
import 'package:study_app/bloc_login_remake/pages/HomePage.dart';
import 'package:study_app/bloc_login_remake/pages/LoginPage.dart';

void main() {
  runApp(BlocProvider<AuthenticationBloc>(
    builder: (context) {
      return AuthenticationBloc()..dispatch(AppStarted());
    },
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc _bloc= BlocProvider.of<AuthenticationBloc>(context);
    final state = _bloc.currentState;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
        bloc: _bloc,
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationUninitialized) {
            return new SplashPage();
          } else if (state is AuthenticationAuthenticated) {
            return new HomePage();
          } else if (state is AuthenticationUnauthenticated) {
            return new LoginPage();
          } else if (state is AuthenticationLoading) {
            return new LoadingIndicator();
          }
          return null;
        }
      ),
    );
  }
}*/

/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_app/provider_counter/pages/MainPage.dart';
import 'package:study_app/provider_counter/utils/CounterProvider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider<Counter>(
          builder: (_) => Counter(0),
          child: MainPage(),
        )
    );
  }
}
*/
