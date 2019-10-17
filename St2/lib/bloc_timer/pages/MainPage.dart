import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/TimerBloc.dart';
import '../widgets/Actions.dart';
import '../widgets/Background.dart';

class Timer extends StatelessWidget {
  static const TextStyle timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    final TimerBloc _timerBloc = BlocProvider.of<TimerBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Timer')),
      body: Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(
                  child: BlocBuilder(
                    bloc: _timerBloc,
                    builder: (context, state) {
                      final String minutesStr = ((state.duration / 60) % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      final String secondsStr = (state.duration % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      return Text(
                        '$minutesStr:$secondsStr',
                        style: timerTextStyle,
                      );
                    },
                  ),
                ),
              ),
//              BlocBuilder(
//                condition: (previousState, currentState) => currentState.runtimeType != previousState.runtimeType,
//                bloc: _timerBloc,
//                builder: (context, state) => Actions(),
//              ),
            ],
          ),
        ],
      ),
    );
  }
}