import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {
  Widget buildListItem() {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Programing tutorials Channel",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Text(
                    "This channel contains tutorial videos in Flutter, React Native, React, Angular",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black38,
                    ),
                  )
                ],
              ),
            ),
            new Icon(Icons.favorite, color: Colors.red),
            new Text(" 100", style: new TextStyle(fontSize: 16.0),),
          ],
        )
    );
  }

  Widget buildButton(IconData icon, String buttonTitle) {
    final Color tintColor = Colors.blue;
    return new Column(
      children: <Widget>[
        new Icon(icon, color: tintColor),
        new Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: new Text(
            buttonTitle,
            style: new TextStyle(fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: tintColor),),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget fourButtonsSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //build in a separated function
          buildButton(Icons.home, "Home"),
          buildButton(Icons.arrow_back, "Back"),
          buildButton(Icons.arrow_forward, "Next"),
          buildButton(Icons.share, "Share"),
        ],
      ),
    );

    final bottomTextSection = new Container(
      padding: const EdgeInsets.all(20.0),
      //How to show long text ?
      child: new Text('''I am Nguyen Duc Hoang, I live in Hanoi, Vietnam. I create this channel which contains videos in Swift programming language, python, NodeJS, Angular, Typescript, ReactJS, React Native, ios and android programming, Kotlin programming, new technologies' overviews. These videos will help people learn latest programming language and software framework. They will be also very useful for their work or business. My channel's languages are English and Vietnamese.''',
          style: new TextStyle(
              color: Colors.grey[850],
              fontSize: 16.0
          )
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: new Text("Layout demo"),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('assets/tutorialChannel.png',
            fit: BoxFit.cover,
          ),
          buildListItem(),
          fourButtonsSection,
          bottomTextSection
        ],
      )
    );
  }
}