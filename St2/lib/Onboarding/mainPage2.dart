import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:study_app/Onboarding/data.dart';

class MyOnBoarding extends StatefulWidget {
  @override
  State createState() => new _MyAppState();
}

class _MyAppState extends State<MyOnBoarding> with TickerProviderStateMixin {
  PageController _pageController;
  int currentPage = 0;


  @override
  void initState() {
    _pageController = new PageController(
      initialPage: currentPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF487563), Color(0xFF29323C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.clamp,
          stops: [0.0, 1.0]
        )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              PageView.builder(
                controller: _pageController,
                itemCount: pageList.length,
                onPageChanged: (index) {
                  print('Index: ' + index.toString());
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 30.0,
                            left: 20.0,
                            right: 20.0
                        ),
                        child: Image.asset(pageList[index].imageUrl),
                      ),
                      Stack(
                        children: <Widget>[
                          Opacity(opacity: 0.2,
                            child: new GradientText(
                              pageList[index].title,
                              gradient: LinearGradient(
                                  colors: pageList[index].titleGradient
                              ),
                              style: TextStyle(
                                  fontFamily: "Montserrat-Black",
                                  fontSize: 80.0,
                                  letterSpacing: 1.0
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.0, left: 22.0),
                            child: new GradientText(
                              pageList[index].title,
                              gradient: LinearGradient(
                                  colors: pageList[index].titleGradient
                              ),
                              style: TextStyle(
                                  fontFamily: "Montserrat-Black",
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        pageList[index].body,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: "Montserrat-Medium",
                            color: Color(0xFF9B9B9B)),
                      ),
                    ],
                  );
                }
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: PageIndicator(0, pageList.length)),
              ),
              Positioned(
                right: 0.0,
                bottom: 0.0,
                child: Container(
                    height: 50.0,
                    width: 100.0,
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
                ),
              )
            ],
          )
      ),
    );
  }
}

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
