import "package:flutter/material.dart";
import '../blocs/CounterBloc.dart';
import '../blocs/CounterEvents.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Counter'),
      ),
      body: BlocBuilder(
        bloc: _counterBloc,
        builder: (BuildContext context, int count) {
          return new Center(
            child: Text('$count'),
          );
        }
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            child:new FloatingActionButton(
              onPressed: () {
                _counterBloc.dispatch(CounterEvent.increment);
              },
              child: Icon(Icons.add),
            ),
            padding: EdgeInsets.all(3.0)
          ),
          Padding(
            child: new FloatingActionButton(
              onPressed: () {
                _counterBloc.dispatch(CounterEvent.decrement);
              },
              child: Icon(Icons.remove),
            ),
            padding: EdgeInsets.all(3.0)
          )
        ],
      ),
    );
  }
}