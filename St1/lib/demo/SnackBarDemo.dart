import "package:flutter/material.dart";

class SnackBarDemo extends StatelessWidget {
  final GlobalKey<ScaffoldState> _mainScaffold = new GlobalKey<ScaffoldState>();

  void _showSnackBar() {
    final snackBar = SnackBar(
      content: Text('This is notification!!',
        style: TextStyle(fontSize: 20.0),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.lightGreen,
      action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
          textColor: Colors.black,
      ),
    );
    _mainScaffold.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _mainScaffold,
      appBar: AppBar(
        title: Container(
          alignment: Alignment(0, 0),
          child: Text('SnackBar Demo',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.announcement),
            onPressed: _showSnackBar
          )
        ],
      ),
    );
  }
}

