import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:study_app/bloc_infinity_list/blocs/postEvent.dart';
import 'package:study_app/bloc_infinity_list/blocs/postState.dart';
import 'package:study_app/bloc_infinity_list/entities/post.dart';

class PostBloc  extends Bloc<PostEvent, PostState>{
  final http.Client httpClient;

  PostBloc({@required this.httpClient});

  @override
  void onTransition(Transition<PostEvent, PostState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<PostState> transform(
      Stream<PostEvent> events,
      Stream<PostState> Function(PostEvent event) next,
      ) {
    return super.transform(
      (events as Observable<PostEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    print('fetch');
    if (event is Fetch/* && _hasReachedMax(currentState)*/) {
      try {
        if (currentState is PostUninitialized) {
          print("load 1");
          final posts = await _fetchPosts(0, 20);
          yield PostLoaded(posts: posts, hasReachedMax: false);
        } else if (currentState is PostLoaded) {
          print("load 2");
          final posts = await _fetchPosts((currentState as PostLoaded).posts.length, 20);
          yield posts.isEmpty
              ? (currentState as PostLoaded).copyWith(hasReachedMax: true)
              : PostLoaded(
            posts: (currentState as PostLoaded).posts + posts,
            hasReachedMax: false,
          );
        } else {
          print('not load');
        }
      } catch (_) {
        yield PostError();
      }
    } else {
      print('wrong');
    }
  }


  bool _hasReachedMax(PostState state) =>
      state is PostLoaded && state.hasReachedMax;

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    final response = await httpClient.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return Post(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}