import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/bloc_login_remake/blocs/AuthenticationBloc.dart';
import 'package:study_app/bloc_login_remake/blocs/AuthenticationEvent.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
    BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
            child: RaisedButton(
              child: Text('logout'),
              onPressed: () {
                authenticationBloc.dispatch(LoggedOut());
              },
            )),
      ),
    );
  }
}