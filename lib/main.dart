import 'package:flutter/material.dart';
import 'diary_home.dart';
import 'dear_diary.dart';

void main() => runApp(Deardiary());

class Deardiary extends StatefulWidget {

  @override
  MainState createState() => MainState();

}

class MainState extends State<Deardiary>{

  final List list = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Hello Dear Diary!"),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  DiaryHome((String title, String description) {
                    list.add(DiaryCard(
                        title: title,
                        subtitle: "Noah",
                        discription: description,
                        color: Colors.grey));

                    setState(() {

                    });
                  }),


                  new Column(
                      children:list
                  )
                ],
              ),
            ),
          )),
    );
  }
}
