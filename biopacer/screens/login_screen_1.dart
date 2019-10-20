import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
    bool _showPassword;
    @override
    void initState() {
        super.initState();
        _showPassword = false;
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login_creen.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Expanded(
                            flex: 9,
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 130.0,
                                    left: 40.0
                                ),
                                child: Text('Sign in',
                                    style: TextStyle(
                                        fontSize: 33.0,
                                        fontFamily: 'Asap',
                                        fontWeight: FontWeight.w700
                                    ),
                                ),
                            ),
                        ),
                        Expanded(
                            flex: 8,
                            child: SingleChildScrollView(
                                dragStartBehavior: DragStartBehavior.down,

                                child: Container(
                                    padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                            Padding(
                                                padding: EdgeInsets.only(top: 25.0),
                                            ),
                                            Container(
                                                width: double.infinity,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: new BorderRadius.all(
                                                        Radius.circular(22.0)
                                                    ),
                                                    boxShadow: [
                                                        new BoxShadow(
                                                            color: Colors.black12,
                                                            blurRadius: 22.0,
                                                        )
                                                    ],
                                                ),
                                                child: SizedBox(
                                                    width: double.infinity,
                                                    height: 45.0,
                                                    child: TextFormField(
                                                        initialValue: 'EnableStartup',
                                                        decoration: new InputDecoration(
                                                            contentPadding: EdgeInsets.all(15.0),
                                                            hintText: "Enter Email",
                                                            prefixIcon: Icon(Icons.account_circle),
                                                            fillColor: Colors.white,
                                                            border: InputBorder.none,
                                                        ),
                                                        style: TextStyle(
                                                            fontFamily: 'Asap',
                                                            color: Color(0xFF2C3333),
                                                            fontWeight: FontWeight.w700,
                                                            fontSize: 15.0
                                                        ),
                                                        textAlign: TextAlign.center,
                                                    )
                                                ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 20.0),
                                            ),
                                            Container(
                                                width: double.infinity,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: new BorderRadius.all(
                                                        Radius.circular(22.0)
                                                    ),
                                                    boxShadow: [
                                                        new BoxShadow(
                                                            color: Colors.black12,
                                                            blurRadius: 22.0,
                                                        )
                                                    ],
                                                ),
                                                child: TextFormField(
                                                    decoration: new InputDecoration(
                                                        contentPadding: EdgeInsets.all(12.0),
                                                        hintText: "Enter Password",
                                                        prefixIcon: Icon(Icons.vpn_key),
                                                        suffixIcon: IconButton(
                                                            icon: Icon(
                                                                Icons.visibility,
                                                                color: this._showPassword ? Colors.red : Color(0xFFC4C4C4),
                                                            ),
                                                            onPressed: () =>
                                                                this.setState(() =>
                                                                this._showPassword = !this._showPassword)
                                                        ),
                                                        border: InputBorder.none,
                                                    ),// InputDecoration.collapsed(hintText: "")
                                                    style: TextStyle(
                                                        fontFamily: 'Asap',
                                                        fontWeight: FontWeight.w700,
                                                        color: Color(0xFFC4C4C4)
                                                    ),
                                                    obscureText: !this._showPassword,
                                                    textAlign: TextAlign.center,
                                                )
                                            ),
                                            Padding(padding: EdgeInsets.only(top: 22.0)),
                                            Text('I forgot password',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Asap',
                                                    color: Color(0xFF82D6D8),
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                            ),
                        ),
                        Expanded(
                            flex: 7,
                            child: Container(
                                padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                        SizedBox(
                                            width: double.infinity,
                                            height: 50.0,
                                            child: RaisedButton(
                                                onPressed: () { },
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                                padding: const EdgeInsets.all(0.0),
                                                child: Ink(
                                                    decoration: const BoxDecoration(
                                                        gradient: LinearGradient(
                                                            colors: [
                                                                Color.fromARGB(30, 150, 235, 214),
                                                                Color.fromARGB(230, 57, 186, 214)
                                                            ],
                                                        ),
                                                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                                                    ),
                                                    child: Container(
                                                        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                                                        alignment: Alignment.center,
                                                        child: const Text('login',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                fontFamily: 'Asap',
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: 18.0
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                        Text('New user?',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'Asap',
                                                color: Color(0xFF5C6472)
                                            ),
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 5.0)),
                                        InkWell(
                                            onTap: () => print('sign up'),
                                            child: Text('Sign up',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Asap',
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.blue,
                                                    decoration: TextDecoration.underline,
                                                ),
                                            ),
                                        ),
                                    ],
                                )
                            ),
                        )
                    ],
                ),
            )
        );
    }
}

class MyBehavior extends ScrollBehavior {
    @override
    Widget buildViewportChrome(
        BuildContext context, Widget child, AxisDirection axisDirection) {
        return child;
    }
}