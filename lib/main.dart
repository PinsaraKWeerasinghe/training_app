import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/home_page/home_page_bloc.dart';
import 'package:training_app/home_page/screens/home_page_view.dart';


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
      home: BlocProvider<HomePageBloc>(
        create: (context) => HomePageBloc(context),
        child: HomePageView(),
      ),
    );
  }
}