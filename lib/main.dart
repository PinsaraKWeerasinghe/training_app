


import 'package:flutter/material.dart';
import 'dear_diary.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DiaryCard(title: "Reasons Why Learning English is so Important", subtitle:"Noah",discription:"English may not be the most spoken language in the world, but it is the official language of 53 continues and spoken...",color:Colors.blue),
    );
  }

}

