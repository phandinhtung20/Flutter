import 'package:equatable/equatable.dart';
import 'package:study_app/bloc_infinity_list_remake/entities/post.dart';

abstract class PostState extends Equatable {
  PostState([List props = const []]) : super(props);
}
//
//class PostUninitialized extends PostState {
//  @override
//  String toString() => 'PostUninitialized';
//}

class PostUninitialized extends PostState {
  @override
  String toString() {
    return 'PostUninitialized';
  }
}

//class PostError extends PostState {
//  @override
//  String toString() => 'PostError';
//}
//

class PostError extends PostState {
  @override
  String toString() {
    return 'PostError';
  }
}

//class PostLoaded extends PostState {
//  final List<Post> posts;
//  final bool hasReachedMax;
//
//  PostLoaded({
//    this.posts,
//    this.hasReachedMax,
//  }) : super([posts, hasReachedMax]);
//
//  PostLoaded copyWith({
//    List<Post> posts,
//    bool hasReachedMax,
//  }) {
//    return PostLoaded(
//      posts: posts ?? this.posts,
//      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
//    );
//  }
//
//  @override
//  String toString() =>
//      'PostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
//}

class PostLoaded extends PostState {
  final List<Post> posts;

  PostLoaded({this.posts}) : super([posts]);

  @override
  String toString() {
    return 'PostLoaded {posts: ${posts.length}}';
  }
}