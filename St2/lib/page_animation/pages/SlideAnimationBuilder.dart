import 'package:flutter/material.dart';

class SlideAnimationBuilder extends PageRouteBuilder {
  Widget widget;

  SlideAnimationBuilder({this.widget})
      :super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation, Widget child) {
      Animation<Offset> _customAnimation = Tween(begin: Offset(1,1), end: Offset(0, 0)).animate(animation);

      return SlideTransition(position: _customAnimation, child: child,);
    }
  );
}