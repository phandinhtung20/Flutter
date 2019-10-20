import 'package:flutter/material.dart';

class Feature1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            children: <Widget>[
              Feature(0),
              Feature(1)
            ],
          ),
          Center(
            child: Text("Hello",
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white
              ),
            ),
          )
        ],
      )
    );
  }
}

// ignore: must_be_immutable
class Feature extends StatelessWidget {
  int _page;
  Feature(this._page);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('bg_feature.png'),
          fit: BoxFit.fitHeight,
          alignment: Alignment(_page==0?-0.5:0.54, 0)
        )
      ),
    );
  }
}