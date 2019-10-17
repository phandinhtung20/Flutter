import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:study_app/provider_counter/utils/CounterProvider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Counter'),
      ),
      body: new Center(
        child: Text('${counter.getCounter()}')
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            child:new FloatingActionButton(
              onPressed: counter.increment,
              child: Icon(Icons.add),
            ),
            padding: EdgeInsets.all(3.0)
          ),
          Padding(
            child: new FloatingActionButton(
              onPressed: counter.decrement,
              child: Icon(Icons.remove),
            ),
            padding: EdgeInsets.all(3.0)
          )
        ],
      ),
    );
  }
}