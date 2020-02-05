import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/home_page/home_page_action.dart';
import 'package:training_app/home_page/home_page_bloc.dart';
import 'package:training_app/home_page/home_page_model.dart';

import 'diary_card.dart';
import 'form_card.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final bloc=BlocProvider.of<HomePageBloc>(context);


    return Scaffold(
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
              bloc.add(LoadCardAction(title,description));
            }),
              BlocBuilder<HomePageBloc, HomePageModel>(
                  builder: (context, state){
                    final List childrenList= <Widget>[];
                    for(int i=0;i<state.titles.length;i++){
                      childrenList.add(DiaryCard(state.titles[i], 'Noah', state.descriptions[i], Colors.orange));
                    }
                    return Column(
                      children: childrenList,
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


