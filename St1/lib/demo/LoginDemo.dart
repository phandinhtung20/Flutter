import 'package:flutter/material.dart';

class LoginDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginState();
  }
}

class _LoginState extends State<LoginDemoWidget>
    with SingleTickerProviderStateMixin{
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/girl.jpeg"),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black38,
          ),
          new Theme(
            data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                labelStyle: new TextStyle(
                  color: Colors.tealAccent,
                  fontSize: 25.0
                )
              )
            ),
            isMaterialAppTheme: true,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlutterLogo(
                  size: _iconAnimation.value* 140.0,
                ),
                new Container(
                  padding: EdgeInsets.all(40.0),
                  child: new Form(
                    autovalidate: true,
                    child: new Column(
                      children: <Widget>[
                        new TextFormField(
                          decoration: InputDecoration(
                            labelText: "Nhập email",
                            fillColor: Colors.green[900]
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: InputDecoration(
                              labelText: "Nhập mật khẩu",
                              fillColor: Colors.green[900]
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                        ),
                        new Padding(padding: EdgeInsets.only(top: 30.0)),
                        new MaterialButton(
                          onPressed: () {

                          },
                          height: 50.0,
                          minWidth: 150.0,
                          color: Colors.green[900],
                          splashColor: Colors.teal,
                          textColor: Colors.white,
                          child: new Text(
                            "Login",
                            style: new TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  )
                )
              ],
            )
          )
        ],
      ),
    );
  }
}

