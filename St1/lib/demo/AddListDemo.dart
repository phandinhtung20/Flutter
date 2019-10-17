import 'package:flutter/material.dart';

class AddListDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddListState();
  }
}

class AddListState extends State<AddListDemo> {
  var items = List<String>.generate(20, (index){
    return 'item ${index}';
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add List Demo'),
      ),
      body: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index){
          return (index == items.length)? 
              RaisedButton(
                child: Text('Load more'),
                onPressed: () {
                  var itemMore = List<String>.generate(10, (index) {
                    return 'item${items.length + index}';
                  });
                  setState(() {
                    items.addAll(itemMore);
                  });
                },
              ):
              ListTile(
                title: Text(items[index]),
              )
          ;
        }
      ),
    );
  }
}