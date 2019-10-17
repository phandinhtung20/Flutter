import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //build function returns a "Widget"
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      home: new BlocDemo(),
    );
  }
}

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Count Press"),
          actions: <Widget>[
            new Icon(Icons.autorenew)
          ],
        ),
        body: new BlocProvider(
          bloc: CountBloc(),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: 4,
                  child: CountNumber()
              ),
              new ButtonCount()
            ],
          )
        )
    );
  }
}

class CountNumber extends StatelessWidget {
  CountBloc countBloc;

  @override
  Widget build(BuildContext context) {
    countBloc = BlocProvider.of(context);
    return new Center(
      child: new StreamBuilder(
        initialData: 0,
        stream: countBloc.countStream,
        builder: (BuildContext context, snapShot) {
          return new Text(snapShot.data.toString());
        },
      )
    );
  }
}

class ButtonCount extends StatelessWidget {
  CountBloc countBloc;

  @override
  Widget build(BuildContext context) {
    countBloc = BlocProvider.of(context);
    return Expanded(
      flex: 1,
      child: new Row(
        children: <Widget>[
          new FlatButton(
            onPressed: () {
              countBloc.increaseCount();
            },
            child: Container(
              child: new Icon(Icons.publish),
              color: Colors.black45,
              height: 50.0,
              width: 100.0,
            )
          ),

          new FlatButton(
            onPressed: () {
              countBloc.decreaseCount();
            },
            child: Container(
              child: new Icon(Icons.vertical_align_bottom),
              color: Colors.black45,
              height: 50.0,
              width: 100.0,
            )
          )
        ],
      )
    );
  }
}

Type _typeOf<T>() => T;

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final Widget child;
  final T bloc;

  @override
  _BlocProviderState<T> createState() => new _BlocProviderState();

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<_BlocInherited<T>>();
    _BlocInherited<T> provider = context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    return provider?.bloc;
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    widget.bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new _BlocInherited(child: widget.child, bloc: widget.bloc);
  }
}

class _BlocInherited<T> extends InheritedWidget {
  _BlocInherited({
    Key key,
    @required Widget child,
    @required this.bloc
}) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}

class CountBloc extends BlocBase {
  int count = 0;
  StreamController countStreamController = new StreamController<int>.broadcast();
  Sink get countSink => countStreamController.sink;
  Stream<int> get countStream => countStreamController.stream;

  increaseCount() {
    count++;
    countSink.add(count);
  }

  decreaseCount() {
    count--;
    countSink.add(count);
  }

  @override
  void dispose() {
    countStreamController.close();
  }
}
