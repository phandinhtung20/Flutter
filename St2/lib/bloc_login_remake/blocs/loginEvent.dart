import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const[]]):super(props);
}

class ButtonLoginPress extends LoginEvent {
  final String username;
  final String password;

  ButtonLoginPress({
    @required this.username,
    @required this.password}) : super([username, password]);

  @override
  String toString() {
    return 'LoginButtonPressed { username: $username, password: $password }';
  }
}