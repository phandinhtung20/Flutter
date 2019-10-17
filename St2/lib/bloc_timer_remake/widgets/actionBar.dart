import 'package:flutter/material.dart';
import 'package:study_app/bloc_timer_remake/blocs/timerEvent.dart';
import 'package:study_app/bloc_timer_remake/blocs/timerState.dart';
import 'package:study_app/bloc_timer_remake/blocs/timerBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TimerBloc _timeBloc = BlocProvider.of<TimerBloc>(context);
    if (_timeBloc.currentState is Ready) {
      return FloatingActionButton(
        onPressed: () {
          _timeBloc.dispatch(Start(duration: _timeBloc.currentState.duration));
        },
        child: Icon(Icons.play_arrow),
      );
    } else if (_timeBloc.currentState is Running) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _timeBloc.dispatch(Pause());
            },
            child: Icon(Icons.pause),
          ),
          FloatingActionButton(
            onPressed: () {
              _timeBloc.dispatch(Reset());
            },
            child: Icon(Icons.refresh),
          )
        ],
      );
    } else if (_timeBloc.currentState is Paused) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _timeBloc.dispatch(Resume());
            },
            child: Icon(Icons.play_arrow),
          ),
          FloatingActionButton(
            onPressed: () {
              _timeBloc.dispatch(Reset());
            },
            child: Icon(Icons.refresh),
          )
        ],
      );
    } else if (_timeBloc.currentState is Finished) {
      return FloatingActionButton(
        onPressed: () {
          _timeBloc.dispatch(Reset());
        },
        child: Icon(Icons.refresh),
      );
    }
  }
}