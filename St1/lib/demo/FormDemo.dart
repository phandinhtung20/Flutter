import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormState();
  }
}

class FormState extends State<FormDemo> {
  String username = '';
  String email = '';
  String password = '';

  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  Widget _buildInputBox(Widget textField) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(const Radius.circular(6.0)),
            color: Color.fromARGB(200, 250, 250, 250),
            border: Border.all(
                color: Colors.black45,
                width: 1.0,
                style: BorderStyle.solid
            )
        ),
        child: textField
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('Form Demo'),
      ),
      body: Column(
        children: <Widget>[
          _buildInputBox(
            TextField(
              decoration: InputDecoration(
                  hintText: 'Enter username',
                  contentPadding: EdgeInsets.all(10.0),
                  border: InputBorder.none
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              onChanged: (text) {
                setState(() {
                  username = text;
                });
              },
            )
          ),
          _buildInputBox(
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter password',
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none
                ),
                keyboardType: TextInputType.text,
                autocorrect: false,
                obscureText: true,
                onChanged: (text) {
                  setState(() {
                    password = text;
                  });
                },
              )
          ),
          _buildInputBox(
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter email',
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onChanged: (text) {
                  setState(() {
                    email = text;
                  });
                },
              )
          ),
          Container(
            margin: new EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                        child: Text('Login'),
                        onPressed: () {
                          Widget snackBar = SnackBar(content: Text('${username} - ${email} - ${password}'));
                          _globalKey.currentState.showSnackBar(snackBar);
                        }
                    )
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}