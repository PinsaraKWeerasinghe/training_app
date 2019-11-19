import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'package:flutter/rendering.dart';

class Diary extends StatefulWidget {
  String name;
  Diary({this.name});

  @override
  _Diary createState() => _Diary(name);
}

class _Diary extends State<Diary> {
  String name;
  _Diary(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6F4E37),
      appBar: AppBar(
        backgroundColor: Color(0xFF6F4E37),
        leading: IconButton(
          icon: Icon(Icons.add),
          iconSize: 30,
          color: Color(0xFFCFC6C0),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ));
          },
        ),
        title: Text(
          "Dear Diar",
          style: TextStyle(
            color: Color(0xFFCFC6C0),
            fontFamily: 'Nightcall',
            fontSize: 24,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            iconSize: 30,
            color: Color(0xFFCFC6C0),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 90,
            color: Color(0xFF6F4E37),
          ),
        ],
      ),
    );
  }
}
