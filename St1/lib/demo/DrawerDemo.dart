import 'package:flutter/material.dart';

class DrawerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DrawerState();
  }
}

class DrawerState extends State<DrawerDemo> {
  String title = 'Phan Đình Tùng';

  closeDrawer(String info, BuildContext context) {
    setState(() {
      title = info;
    });
    Navigator.pop(context);
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/girl.jpeg',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                  Text('Phan Dinh Tung',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'BalooChettan'
                    )
                  ),
                  Text('Software developer',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'BalooChettan'
                      )
                  )
                ],
              ),
            ),
            decoration: new BoxDecoration(
                color: Colors.blue
            )
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: new Text('Photos'),
            onTap: () {
              closeDrawer('Photos', context);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: new Text('Notifications'),
            onTap: () {
              closeDrawer('Notifications', context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: new Text('Settings'),
            onTap: () {
              closeDrawer('Settings', context);
            },
          ),
          Divider(
            indent: 10,
            color: Colors.black26
            ,
          ),
          ListTile(
            title: new Text('About'),
            onTap: () {
              closeDrawer('About', context);
            },
          ),
          ListTile(
            title: new Text('Privacy'),
            onTap: () {
              closeDrawer('Privacy', context);
            },
          )
        ],
      ),
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
      drawer: _buildDrawer(context),
      body: Center(
        child: new Text(
          title,
          style: TextStyle(
              fontSize: 50.0,
              fontFamily: 'IndieFlower'
          ),
        )
      )
    );
  }
}