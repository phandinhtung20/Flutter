import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/imgs/maldives.jpg"),
            fit: BoxFit.fitHeight,
            alignment: Alignment(0.2, 0.5),
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
            child: new Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment(0.5, 0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("Login",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black
                    ),
                  ),
                  new TextFormField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        hintText: "Tên đăng nhập",
                        errorText: null//"Nhập sai rồi"
                    ),
                  ),
                  new TextFormField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        hintText: "Tên mật khẩu",
                        errorText: null//"Nhập mật khẩu sai"
                    ),

                  ),
                ],
              )
            )
          )
        ],
      )
    );
  }
}