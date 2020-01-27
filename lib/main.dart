import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'diary_card.dart';
import 'form_card.dart';

void main() => runApp(Diary());

class Diary extends StatefulWidget {
  @override
  _mainState createState() => _mainState();
}
class _mainState extends State<Diary> {
  final List childrenList= <Widget>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dear Diary --> Home'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Icons.account_circle, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.cyan,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 1500,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormCard((String title, String description){
                  childrenList.add(DiaryCard(title,'Noah',description,Colors.orange));
                  setState(() {});
                }),
                Column(
                  children: childrenList,
                )
//                childrenList.add(DiaryCard(title,'Noah',description,Colors.orange));
              ],
            ),
          ),
        ),
      ),
    );
  }

}