import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:smart_flare/smart_flare.dart';

class App extends StatefulWidget {
  @override
  _FlareDemoState createState() => new _FlareDemoState();
}

enum AnimationToPlay {
  Activate,
  Deactivate,
  CameraTapped,
  PulseTapped,
  ImageTapped
}

class _FlareDemoState extends State<App> {
  @override
  Widget build(BuildContext context) {
    var animationWidth = 295.0;
    var animationHeight = 251.0;
    var animationWidthThirds = animationWidth / 3;
    var halfAnimationHeight =animationHeight / 2;

    var activeAreas = [

      ActiveArea(
        area: Rect.fromLTWH(50, 35, 70, 67),
        debugArea: true,
        guardComingFrom: ['deactivate'],
        animationName: 'camera_tapped'),

      ActiveArea(
        area: Rect.fromLTWH(120, 35, 70, 67),
        debugArea: true,
        guardComingFrom: ['deactivate'],
        animationName: 'pulse_tapped'),

      ActiveArea(
        area: Rect.fromLTWH(190, 35, 70, 67),
        debugArea: true,
        guardComingFrom: ['deactivate'],
        animationName: 'image_tapped'),

      ActiveArea(
        area: Rect.fromLTWH(100, 135, 100, 100),
        debugArea: true,
        animationsToCycle: ['activate', 'deactivate'],
        onAreaTapped: () {
          print('Button tapped!');
        })
    ];


    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 102, 18, 222),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SmartFlareActor(
            width: animationWidth,
            height: animationHeight,
            filename: 'assets/floatButton.flr',
            startingAnimation: 'deactivate',
            activeAreas: activeAreas,
          )
        ),
      )
    );
  }
}