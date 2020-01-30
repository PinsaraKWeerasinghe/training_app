import 'package:flutter/material.dart';
import 'package:training_app/diary_card.dart';
import 'package:training_app/diary_home.dart';

void main() => runApp(Diary());

class Diary extends StatefulWidget{

  @override
  _state createState() => _state();

  }
  class _state extends State<Diary>{

  final List list = <Widget>[];

  @override
  Widget build(BuildContext context) {
    String sub="Noah";

   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(
         title: Text('Hello Diary'),
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
               DiaryHome((String title, String description){
                 list.add(DiaryCard(title, sub, description, Colors.teal));
                 setState(() {});
               }),
               Column(
                 children: list,
               )
             ],
           ),
         ),
       ),
     ),
   );
  }

  }