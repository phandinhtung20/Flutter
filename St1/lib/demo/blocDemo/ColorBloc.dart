import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ColorBloc {
// streams of Color
  StreamController streamListController = StreamController<Color>.broadcast();
// sink
  Sink get colorSink => streamListController.sink;
// stream
  Stream<Color> get colorStream => streamListController.stream;

// function to change the color
  changeColor() {
    colorSink.add(getRandomColor());
  }
}

// Random Colour generator
Color getRandomColor() {
  Random _random = Random();
  return Color.fromARGB(
    _random.nextInt(256),
    _random.nextInt(256),
    _random.nextInt(256),
    _random.nextInt(256),
  );
}
