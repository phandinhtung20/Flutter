import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ToDo {
  ToDo({this.id, this.name, this.detail});
  int id;
  String name;
  String detail;

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json["id"],
      name: json["name"],
      detail: json["detail"],
    );
  }
}

Future<List<ToDo>> fetchToDo(http.Client client) async {
  final response = await client.get(
      Uri.encodeFull('http://192.168.137.65:3000/todos'),
      headers: {
        "Accept": "application/json"
      });
  if(response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if(mapResponse["status"] == "ok") {
      final toDos = mapResponse["message"].cast<Map<String, dynamic>>();
      final listOfToDos = await toDos.map<ToDo>((json) {
        return ToDo.fromJson(json);
      }).toList();
      return listOfToDos;
    } else {
      return [];
    }
  } else {
    throw Exception('Failed to load Todo from the Internet');
  }
}