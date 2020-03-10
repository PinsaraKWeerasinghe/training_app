import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingapp/db/model/PostModel.dart';

import 'DiaryCard.dart';
import 'dc_home_bloc.dart';
import 'dc_home_event.dart';
import 'dc_home_state.dart';

class DiaryHomeView extends StatelessWidget {
  final log = Log("DiaryHomeView");

  var _controllerTitle = TextEditingController();
  var _controllerDescription = TextEditingController();
  var _userName ;
  var _existCardList;
  bool _initiate=true;


  DiaryHomeView(this._userName, this._existCardList);

  static final loadingWidget = Center(
    child: CircularProgressIndicator(),
  );

  @override
  Widget build(BuildContext context) {
    final dc_homeBloc = BlocProvider.of<DiaryHomeBloc>(context);

    log.d("Loading DiaryHome View");

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: GestureDetector(
        onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
        child: Container(
          color: Colors.lightBlueAccent,
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    color: Color(0xFF42A5F5),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
//                color: Colors.lightBlueAccent,
                child: TextField(
                  controller: _controllerTitle,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Submit New '),
                ),
              ),
              Container(
                height: 5,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Color(0xFF42A5F5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
//                color: Colors.lightBlueAccent,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: _controllerDescription,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Enter Description'),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: BlocBuilder<DiaryHomeBloc,DiaryHomeState>(
                      builder: (context,state){
                        return RaisedButton(
                          color: Color(0xFF2962FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            String title = _controllerTitle.text;
                            String description = _controllerDescription.text;

                            //Validation
                            if (title == "" && description == "") {
                              print("Missing title and Missing description");
                            } else if (title != "" && description == "") {
                              print("Missing description");
                            } else if (title == "" && description != "") {
                              print("Missing title");
                            } else {
                              //print Title and description
                              print("Title: " + title);
                              print("Description: " + description);

                              dc_homeBloc.add(DiaryCardSubmitEvent(title,_userName, description));

                              _controllerTitle.clear();
                              _controllerDescription.clear();
                              _initiate=false;
                              FocusScope.of(context).requestFocus(new FocusNode());
                            }
                          },
                          child: Text("SUBMIT"),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: BlocBuilder<DiaryHomeBloc,DiaryHomeState>(
                    builder: (context, state) {
                      return Container(
                        child: ListView.builder(
                          itemCount: _initiate?_existCardList.length:state.cardList.length,
                          itemBuilder: (context, index) {
                            Post item = _initiate?_existCardList[index]:state.cardList[index];
                            return DiaryCard(item.title,item.user,item.description);
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
