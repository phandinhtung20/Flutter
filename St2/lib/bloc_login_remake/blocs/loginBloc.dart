import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:study_app/bloc_login_remake/blocs/AuthenticationBloc.dart';
import 'package:study_app/bloc_login_remake/blocs/AuthenticationEvent.dart';
import 'package:study_app/bloc_login_remake/blocs/loginEvent.dart';
import 'package:study_app/bloc_login_remake/blocs/loginState.dart';
import 'package:study_app/bloc_login_remake/entities/userRepository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;

  @override
  LoginState get initialState => LoginInitial();

  LoginBloc({@required this.authenticationBloc}) : assert(authenticationBloc != null);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is ButtonLoginPress) {
      yield LoginLoading();
      try {
        final token = await UserRepository.instance().authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }

}