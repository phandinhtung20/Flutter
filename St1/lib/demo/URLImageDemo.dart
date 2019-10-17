/*
*Mr Nguyen Duc Hoang,
* Youtube channel: https://www.youtube.com/c/nguyenduchoang
* Programming tutorial channel
 */
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class URLImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return URLImageState();
  }
}
class URLImageState extends State<URLImage> {
  @override
  Widget build(BuildContext context) {
    final cachedImage = new CachedNetworkImage(
      placeholder: new CircularProgressIndicator(),
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/6e/Lactarius_indigo_48568.jpg'
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Load URL image in Flutter"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Center(
                  child: cachedImage,
                )
              ],
            ),
            new Row(
              children: <Widget>[
              ],
            )
          ],
        ),
      ),
    );
  }
}
