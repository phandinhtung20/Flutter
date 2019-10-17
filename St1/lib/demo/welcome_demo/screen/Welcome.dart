import 'package:flutter/material.dart';
import 'dart:async';

import 'package:my_app/demo/welcome_demo//utils/MyNavigator.dart';

class WelcomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WelcomeState();
  }
}

class WelcomeState extends State<WelcomeWidget> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () => MyNavigator.goToIntro(context));

  }

  @override
  Widget build(BuildContext context) {
    var iconCart = new Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50.0,
            child: Icon(Icons.shopping_cart, size: 50.0,),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Text("FlutKart", style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold
          ))
        ],
      )
    );
    var processCircle = new Expanded(
      flex: 1,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text('"Only select\nAll will in home"',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
              ),
            ),
          ],
        )
      )
    );

    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
                color: Colors.purpleAccent
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                iconCart,
                processCircle
              ],
            )
          ],
        )
    );
  }
}