import 'package:flutter/material.dart';

class TabDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment(0, 0),
            child: Text(
              'Tab Demo',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'IndieFlower'
              ),
            ),
          ),
          bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home',),
                Tab(icon: Icon(Icons.group), text: 'Group',),
                Tab(icon: Icon(Icons.chat), text: 'Chat',),
                Tab(icon: Icon(Icons.cloud), text: 'Cloud',)
              ]
          ),
        ),
        body: TabBarView(
          children: [
            TabItem(content: 'Home'),
            TabItem(content: 'Phan Đình Tùng'),
            TabItem(content: 'Chat'),
            TabItem(content: 'Cloud')
          ]
        ),
      )
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({Key key, @required this.content}) : super(key: key);
  final String content;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        content,
        style: TextStyle(fontSize: 25.0, fontFamily: 'BalooChettan'),
      ),
    );
  }
}