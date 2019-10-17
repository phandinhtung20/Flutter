import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './timerEvent.dart';
import './timerState.dart';
import '../utils/ticker.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  final int _duration = 60;

  StreamSubscription<int> _tickerSubscription;

  TimerBloc({@required Ticker ticker}) : assert(ticker != null) ,_ticker = ticker;

  @override
  TimerState get initialState => Ready(_duration);

  @override
  void onTransition(Transition<TimerEvent, TimerState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is Start) {
      yield Running(event.duration);
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker.tick(ticks: event.duration).listen((duration) {
        dispatch(Tick(duration: duration));
      });
    }

    if (event is Pause) {
      final state = currentState;
      if (state is Running) {
        _tickerSubscription?.pause();
        yield Paused(state.duration);
      }
    }

    if (event is Resume) {
      final state = currentState;
      if (state is Paused) {
        _tickerSubscription?.resume();
        yield Running(state.duration);
      }
    }

    if (event is Reset) {
      _tickerSubscription?.cancel();
      yield Ready(this._duration);
    }

    if (event is Tick) {
      yield event.duration > 0 ? Running(event.duration) : Finished();
    }
  }

  @override
  void dispose() {
    _tickerSubscription?.cancel();
    super.dispose();
  }
}

