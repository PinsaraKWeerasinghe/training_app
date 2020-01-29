import 'package:flutter/material.dart';
import 'package:training_app/diary_card.dart';

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
        body: DiaryCard(title: "In ancient manuscripts, another means to..",
          subtitle:"In ancient",
          discription: "In ancient manuscripts, another means to divide sentences into paragraphs was a line break (newline) followed by an initial at the beginning.",color: Colors.grey,),

//============to diary_home.dart==========
//          body: SafeArea(
//          child : Center(
//              child : Container(
//                  width: 320,
//                  padding: EdgeInsets.all(10.0),
//                  child: TextField(
//                    autocorrect: true,
//                    decoration: InputDecoration(
//                      hintText: 'Submit New...',
//                      hintStyle: TextStyle(color: Colors.grey),
//                      filled: true,
//                      fillColor: Colors.white70,
//                      enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                        borderSide: BorderSide(color: Colors.red, width: 2),
//                      ),
//                      focusedBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                        borderSide: BorderSide(color: Colors.red),
//                      ),
//                    ),)
//              ))
//      )
 //=========================================
    ),
    );
  }
}