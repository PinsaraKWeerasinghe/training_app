import 'package:flutter/material.dart';
import 'package:training_app/diary_card.dart';
import 'package:training_app/diary_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Diary Card"),
        ),

//==========to diary_card.dart============

//        body: DiaryCard(title: "In ancient manuscripts, another means to..",
//          subtitle:"In ancient",
//          discription: "In ancient manuscripts, another means to divide sentences into paragraphs was a line break (newline) followed by an initial at the beginning.",color: Colors.grey,),
//      ),

//============to diary_home.dart==========

      body: SingleChildScrollView(
        child: DiaryHome(),
      ),

 //=========================================
    ),
    );
  }
}