import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/diary_card.dart';
import 'package:training_app/ui/diary_home.dart';

import 'homepage_action.dart';
import 'homepage_bloc.dart';
import 'homepage_model.dart';

class HomepageView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final blocProvider =BlocProvider.of<HomePageBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Diary"),
        actions: <Widget>[]

      ),
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        child: Container(
          padding:EdgeInsets.fromLTRB(10, 10, 10, 0),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DiaryHome((String title, String description){
              blocProvider.add(SubmitAction(title,description));

            }),
              BlocBuilder<HomePageBloc, HomePageModel>(
                builder: (context, state){
                  final List list = <Widget>[];
                  for(int i =0; i<  state.titles.length; i++){
                    list.add(DiaryCard(state.titles[i],'Noah', state.descriptions[i],Colors.teal));

                  }
                  return Column(
                    children: list,
                  );
                }
              )
            ],
          ),
        ),
      ),

    );
  }

}