import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//DiaryCard Widget
class DiaryCard extends StatefulWidget {
  String title;
  String subTitle;
  String description;

  @override
  _DiaryCardState createState() =>
      _DiaryCardState(title, subTitle, description);

  DiaryCard(String title, String subTitle, String description) {
    this.title = title;
    this.subTitle = subTitle;
    this.description = description;
  }
}

class _DiaryCardState extends State<DiaryCard> {
  //Parameters
  String title = "";
  String subTitle = "";
  String description = "";
  var cardColour = Color(0xFFBBDEFB);

  int noMaximumLines = 3;
  var buttonName = "SHOW MORE";

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColour,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 30),
            ),
            subtitle: Column(
//                direction: Axis.horizontal,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          subTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          description,
                          maxLines: noMaximumLines,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text(buttonName),
                onPressed: () => {
                  setState(() {
                    if (buttonName == "SHOW LESS") {
                      noMaximumLines = 3;
                      buttonName = "SHOW MORE";
                    } else {
                      noMaximumLines = 1000;
                      buttonName = "SHOW LESS";
                    }
                  })
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  _DiaryCardState(String title, String subTitle, String description) {
    this.title = title;
    this.subTitle = subTitle;
    this.description = description;
  }
}
