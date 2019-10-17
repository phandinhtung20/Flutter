import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment(0.0, 0.0),
          child: new Text("GridView Demo",
            style: TextStyle(
              fontSize: 25.0,
            ),
          )
        )
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 220.0,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        children: _buildListGrid(29),
      )
    );
  }

  List<Widget> _buildListGrid(int length) {
    List<Stack> stacks = new List<Stack>.generate(length, (index) {
      return Stack(
          alignment: Alignment(0.0, 1.0),
          children: <Widget>[
            Container(
              height: 220.0,
              width: 220.0,
              child: Image.asset(
                  index < 9
                      ? 'assets/image0${index + 1}.JPG'
                      : 'assets/image${index + 1}.JPG',
                  fit: BoxFit.cover
              )
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color:Color.fromARGB(100, 0, 0, 255)
              ),
              child: Text('assets/image${index + 1}.JPG',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
                ),
              ),
            )
          ]);
    });

    return stacks;
  }
}