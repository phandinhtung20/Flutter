import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int duration;

  TimerState(this.duration, [List props = const []]): super([duration]..addAll(props));
}

class Ready extends TimerState {
  Ready(int duration) : super(duration);

  @override
  String toString() {
    return 'Ready {duration: $duration}';
  }
}

class Running extends TimerState {
  Running(int duration) : super(duration);

  @override
  String toString() {
    return 'Running {duration: $duration}';
  }
}

class Paused extends TimerState {
  Paused(int duration) : super(duration);

  @override
  String toString() {
    return 'Paused {duration: $duration}';
  }
}

class Finished extends TimerState {
  Finished() : super(0);

  @override
  String toString() {
    return 'Finished';
  }
}