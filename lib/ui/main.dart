import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/using_bloc/homepage_bloc.dart';
import 'package:training_app/ui/using_bloc/homepage_view.dart';

void main() => runApp(Diary());

class Diary extends StatefulWidget{

  @override
  _state createState() => _state();

  }
  class _state extends State<Diary>{

  final List list = <Widget>[];

  @override
  Widget build(BuildContext context) {

   return MaterialApp(
     home: BlocProvider<HomePageBloc>(
       create: (context) => HomePageBloc(context),
       child: HomepageView(),
     )
   );
  }
}