import 'package:flutter/material.dart';

class SlideAnimation extends MaterialPageRoute {
  SlideAnimation({WidgetBuilder builder, RouteSettings settings})
      :super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    Animation<Offset> _customAniamtion = Tween(begin: Offset(1,1), end: Offset(0, 0)).animate(animation);

    return SlideTransition(position: _customAniamtion, child: child,);
  }
}