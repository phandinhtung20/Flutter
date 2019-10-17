import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:study_app/bloc_infinity_list_remake/blocs/postEvent.dart';
import 'package:study_app/bloc_infinity_list_remake/blocs/postState.dart';
import 'package:study_app/bloc_infinity_list_remake/entities/post.dart';

class PostBloc  extends Bloc<PostEvent, PostState>{
  final http.Client client;

  PostBloc({@required this.client});

  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    try {
      if (event is Fetch) {
        if (currentState is PostUninitialized) {
          final posts = await _fetchData(0);
          yield PostLoaded(posts: posts);
        } else if (currentState is PostLoaded) {
          print('lengths: ${(currentState as PostLoaded).posts.length}');
          final List<Post> posts = await _fetchData((currentState as PostLoaded).posts.length);
          yield PostLoaded(posts: (currentState as PostLoaded).posts + posts);
        }
      }
    } catch (e) {
      print(e.toString());
      yield PostError();
    }
  }

  Future<List<Post>> _fetchData(int startIndex) async {
    print('startIndex: $startIndex');

    final response = await client.get('https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=10');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;

      List<Post> posts = data.map((item) => new Post(
        id: item['id'],
        title: item['title'],
        body: item['body']
      )).toList();
      print(posts.length);
      return posts;
    } else {
      print('Error');
      throw Exception('Error');
    }
  }
}