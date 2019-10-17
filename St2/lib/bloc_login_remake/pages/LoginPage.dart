import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/bloc_login_remake/blocs/AuthenticationBloc.dart';
import 'package:study_app/bloc_login_remake/blocs/loginBloc.dart';
import 'package:study_app/bloc_login_remake/widgets/LoginForm.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        builder: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)
          );
        },
        child: LoginForm(),
      ),
    );
  }
}