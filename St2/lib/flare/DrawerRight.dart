import 'package:flutter/material.dart';
import 'package:smart_flare/smart_flare.dart';

class DrawerRight extends StatefulWidget {
  @override
  _FlareDemoState createState() => new _FlareDemoState();
}

class _FlareDemoState extends State<DrawerRight> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.height * 256 / 1280;

    print('width: ' + width.toString());

    return Container(
      child: Align(
        alignment: Alignment.centerRight,
        child: PanFlareActor(
          width: width,
          height: screenSize.height,
          filename: 'assets/drawerRight.flr',
          openAnimation: 'open',
          closeAnimation: 'close',
          direction: ActorAdvancingDirection.RightToLeft,
          threshold: 20.0,
          reverseOnRelease: true, // reverse's current animation when released and threshold not reaced
          completeOnThresholdReached: true, // plays the animation till the end when we reach threshold
          activeAreas: [
            RelativePanArea(
                area: Rect.fromLTWH(0, 0.7, 1.0, 0.3), debugArea: true)
          ],
        ),
      )
    );
  }
}