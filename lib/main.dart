import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/home_page/home_page_bloc.dart';
import 'package:training_app/ui/home_page/home_page_view.dart';


void main() => runApp(Deardiary());

//class Deardiary extends StatefulWidget {
//
//  @override
//  MainState createState() => MainState();
//
//}
//
//class MainState extends State<Deardiary>{
//
//  final List list = <Widget>[];
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//          appBar: AppBar(
//            title: Text("Hello Dear Diary!"),
//          ),
//          body: SingleChildScrollView(
//            child: Container(
//              child: Column(
//                children: <Widget>[
//                  DiaryHome((String title, String description) {
//                    list.add(DiaryCard(
//                        title: title,
//                        subtitle: "Noah",
//                        discription: description,
//                        color: Colors.grey));
//
//                    setState(() {
//
//                    });
//                  }),
//
//
//                  new Column(
//                      children:list
//                  )
//                ],
//              ),
//            ),
//          )),
//    );
//  }
//}
//==============================using bloc===========================================================================


class Deardiary extends StatefulWidget {

  @override
  MainState createState() => MainState();

}

class MainState extends State<Deardiary>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<HomePageBloc>(
        create: (context) => HomePageBloc(context),
        child: HomePageView(),
      ),
    );
  }
}