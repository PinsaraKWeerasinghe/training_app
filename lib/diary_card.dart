import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  final String _title;
  final String _subTitle;
  final String _description ;
  final Color _cardColor;

  DiaryCard(this._title,this._subTitle,this._description,this._cardColor);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              elevation: 5,
              color: _cardColor,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0,20,0,0),
                child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10,0,0,0),
                      child: Text(_title,style: TextStyle(fontSize: 30.0),maxLines: 2,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10,0,0,30),
                      child: Text(_subTitle,style: TextStyle(fontSize: 18.0),maxLines: 1,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10,0,0,20),
                      child: Text(_description,style: TextStyle(fontSize: 18.0),maxLines: 3,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.cyan,
                      child: const
                      Text('SHOW MORE',style: TextStyle(fontSize: 20)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]);
  }
}


