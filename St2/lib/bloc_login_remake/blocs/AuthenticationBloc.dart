import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:study_app/bloc_login_remake/blocs/AuthenticationEvent.dart';
import 'package:study_app/bloc_login_remake/blocs/AuthenticationState.dart';
import 'package:study_app/bloc_login_remake/entities/userRepository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await UserRepository.instance().hasToken();
      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    } else if (event is LoggedIn) {
      yield AuthenticationLoading();
      await UserRepository.instance().persistToken(event.token);
      yield AuthenticationAuthenticated();
    } else if (event is LoggedOut) {
      yield AuthenticationLoading();
      await UserRepository.instance().deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }

}