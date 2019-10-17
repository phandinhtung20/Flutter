import 'package:flutter/material.dart';
import 'package:study_app/bloc_timer_remake/blocs/timerBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/bloc_timer_remake/widgets/actionBar.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TimerBloc _timerBloc = BlocProvider.of<TimerBloc>(context);
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Counter'),
      ),
      body: Stack(
        children: <Widget>[
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BlocBuilder(
                bloc: _timerBloc,
                builder: (BuildContext context, state) {
                  return Center(
                    child: Text(state.duration.toString()),
                  );
                },
              ),
              BlocBuilder(
                condition: (previousState, currentState) => previousState.runtimeType != currentState.runtimeType,
                bloc: _timerBloc,
                builder: (BuildContext context, state) => ActionBar(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [
            Color.fromRGBO(72, 74, 126, 1),
            Color.fromRGBO(125, 170, 206, 1),
            Color.fromRGBO(184, 189, 245, 0.7)
          ],
          [
            Color.fromRGBO(72, 74, 126, 1),
            Color.fromRGBO(125, 170, 206, 1),
            Color.fromRGBO(172, 182, 219, 0.7)
          ],
          [
            Color.fromRGBO(72, 73, 126, 1),
            Color.fromRGBO(125, 170, 206, 1),
            Color.fromRGBO(190, 238, 246, 0.7)
          ],
        ],
        durations: [19440, 10800, 6000],
        heightPercentages: [0.03, 0.01, 0.02],
        gradientBegin: Alignment.bottomCenter,
        gradientEnd: Alignment.topCenter,
      ),
      size: Size(double.infinity, double.infinity),
      waveAmplitude: 25,
      backgroundColor: Colors.blue[50],
    );
  }
}