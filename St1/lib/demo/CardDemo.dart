import 'package:flutter/material.dart';

class CardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Cart Demo'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          child: SizedBox(
            height: 200.0,
            child: Card(
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    leading: Icon(Icons.home),
                    title: new Text('Phan Đình Tùng'),
                    subtitle: new Text('Sinh viên DH Bách Khoa Đà Nẵng'),
                  ),
                  Divider(
                    height: 2.0,
                    indent: 10.0,
                  ),
                  new ListTile(
                      leading: Icon(Icons.mail),
                      title: new Text('phandinhtung15@yahoo.com')
                  ),
                  new ListTile(
                      leading: Icon(Icons.phone),
                      title: new Text('0963062078')
                  )
                ],
              ),
            ),
          )
        ),
      )
    );
  }
}