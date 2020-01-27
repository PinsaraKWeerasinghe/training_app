

import 'package:flutter/material.dart';

class DiaryHome extends StatefulWidget {

  final void Function(String, String) onPress;

  _TextInputValueState createState() => _TextInputValueState();

  const DiaryHome(this.onPress);
}

class _TextInputValueState extends State<DiaryHome> {
  final textEditingController = TextEditingController();
  final textEditingController1 = TextEditingController();
  String _showText;
  String _showText1;

  _onPressed() {
    setState(() {

      _showText = textEditingController.text;
      _showText1 = textEditingController1.text;

      if(_showText==""){
        debugPrint("Missing title");
        return;
      }else {
        debugPrint(_showText);
        textEditingController.clear();

      }

      if(_showText1==""){
        debugPrint("Missing description");
        return;
      }else {
        debugPrint(_showText1);
//        textEditingController1.clear();

      }
      widget.onPress(_showText, _showText1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          new Card(
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new TextField(
                          controller: textEditingController,
                          autocorrect: true,
                          decoration: InputDecoration(
                              hintText: "Submit New",
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(const Radius.circular(20.0))
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new TextField(
                            controller: textEditingController1,
                            autocorrect: true,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,

                            decoration: InputDecoration(
                                hintText: "Enter Descriotion",
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(const Radius.circular(20.0))
                                )

                            ),
                          )),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //                crossAxisAlignment: CrossAxisAlignment.center,

                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 300.0,
                        padding: EdgeInsets.only(top: 50.0),
                        child: RaisedButton(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.cyan,
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          onPressed: _onPressed,
                          child: new Text("SUBMIT"),
                        ),
                      )
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
