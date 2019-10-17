import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;
  PageIndicator(this.currentIndex, this.pageCount);

  _indicator(bool isActive) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 4.0,
          decoration: BoxDecoration(
              color: isActive ? Colors.white : Color(0xFF3E4750),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  _buildPageIndicators() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < pageCount; i++) {
      indicatorList
          .add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: _buildPageIndicators(),
    );
  }
}

class NextPage extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final bool isShow;

  NextPage({Key key, @required this.isShow, @required this.scaleAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget nextPageButton = new Container(
      width: 100.0,
      height: 50.0,
      child: new FloatingActionButton(
        isExtended: true,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        onPressed: () {
          print("Next page");
        },
      )
    );
    return ScaleTransition(
      scale: scaleAnimation,
      child: isShow ? nextPageButton: Container(),
    );
  }
}
