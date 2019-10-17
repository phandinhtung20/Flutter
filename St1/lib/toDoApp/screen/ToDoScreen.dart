import 'package:flutter/material.dart';
import 'package:my_app/toDoApp/model/ToDo.dart';
import 'package:http/http.dart' as http;

class ToDoScreen extends StatelessWidget {
  Widget todoList(todos) {
    return ListView.builder(itemBuilder: (context, index)
      {
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10.0),
            color: index % 2 == 0 ? Colors.greenAccent : Colors.cyan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(todos[index].name, style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text('Date: ${todos[index].detail}',
                  style: TextStyle(fontSize: 16.0),)
              ],
            ),
          ),
          onTap: () {
          },
        );
      },
      itemCount: todos.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment(0, 0),
          child: Text(
            'Drawer Demo',
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'BalooChettan'
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: fetchToDo(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('snapshot.error: ${snapshot.error}');
          }
          return snapshot.hasData ? todoList(snapshot.data):Center(child: CircularProgressIndicator());
        }
      )
    );
  }
}