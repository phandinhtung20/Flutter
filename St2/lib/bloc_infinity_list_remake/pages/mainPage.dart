import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_app/bloc_infinity_list_remake/blocs/postBloc.dart';
import 'package:study_app/bloc_infinity_list_remake/blocs/postEvent.dart';
import 'package:study_app/bloc_infinity_list_remake/blocs/postState.dart';
import 'package:study_app/bloc_infinity_list_remake/entities/post.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PostBloc _postBloc = BlocProvider.of<PostBloc>(context);

    return BlocBuilder(
      bloc: _postBloc,
      builder: (BuildContext context, PostState state) {
        if (state is PostUninitialized) {
          _postBloc.dispatch(Fetch());
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PostError) {
          return Center(
            child: Text('failed to fetch posts'),
          );
        }

        if (state is PostLoaded) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text('no posts'),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              if (index >= state.posts.length) {
                print('length: ${state.posts.length}');
                _postBloc.dispatch(Fetch());
                return BottomLoader();
              } else {
                return PostWidget(post: state.posts[index]);
              }
            },
            itemCount: state.posts.length + 1,
          );
        }
        return null;
      },
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 3.0, bottom: 3.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text('${post.id}', style: TextStyle(fontSize: 15.0),),
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: <Widget>[
                  Text(post.title, style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,),
                  Text(post.body, style: TextStyle(fontSize: 13.0), textAlign: TextAlign.justify,)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
