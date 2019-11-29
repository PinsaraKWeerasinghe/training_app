import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:ui_design/post_data.dart';
import 'package:ui_design/services/database.dart';
import 'models/posts.dart';

class Diary extends StatefulWidget {
  String name;
  DocumentReference userRef;
  Diary({this.name, this.userRef});

  @override
  _Diary createState() => _Diary();
}

class _Diary extends State<Diary> with TickerProviderStateMixin {
  var postContainerHeight = 0.0;
  var isExpanded = false;

  final _title_text = TextEditingController();
  final _description_text = TextEditingController();

  Animation _addAnimation;
  AnimationController _addAnimationController;

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Empty Fields"),
      content: Text("Fields cannot be empty"),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _addAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _addAnimation =
        Tween(begin: 0.0, end: pi / 4).animate(_addAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Posts>>.value(
      value: PostDatabaseServices().posts,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF6F4E37),
        appBar: AppBar(
          backgroundColor: Color(0xFF6F4E37),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 30,
            color: Color(0xFFCFC6C0),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Dear Diar",
            style: TextStyle(
              color: Color(0xFFCFC6C0),
              fontFamily: 'Nightcall',
              fontSize: 24,
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            AnimatedBuilder(
              animation: _addAnimationController,
              builder: (context, child) => Transform.rotate(
                angle: _addAnimation.value,
                child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 35,
                  color: Color(0xFFCFC6C0),
                  onPressed: () {
                    setState(() {
                      if (isExpanded) {
                        postContainerHeight = 0.0;
                      } else {
                        postContainerHeight = 320.0;
                      }
                    });
                    if (_addAnimationController.isCompleted) {
                      _addAnimationController.reverse();
                      isExpanded = false;
                    } else {
                      _addAnimationController.forward();
                      isExpanded = true;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFCFC6C0),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF6F4E37),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextField(
                        onChanged: (text) {},
                        controller: _title_text,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'AmericanTypewriter',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9F8A7C),
                          ),
                          hintText: 'Title',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            right: 10,
                            left: 10,
                            top: 7,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'AmericanTypewriter',
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF6F4E37),
                        ),
                        cursorColor: Color(0xFF6F4E37),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: Color(0xFFCFC6C0),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF6F4E37),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextField(
                        controller: _description_text,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (text) {},
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'AmericanTypewriter',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9F8A7C),
                          ),
                          hintText: 'Description',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            right: 10,
                            left: 10,
                            top: 7,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'AmericanTypewriter',
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF6F4E37),
                        ),
                        cursorColor: Color(0xFF6F4E37),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF6F4E37),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 40,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10)),
                          color: Color(0xFFCFC6C0),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'AmericanTypewriter',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6F4E37),
                            ),
                          ),
                          onPressed: () {
                            if ((_title_text.text.isEmpty) ||
                                (_description_text.text.isEmpty)) {
                              showAlertDialog(context);
                            } else {
                              PostDatabaseServices().updatePostData(
                                  _title_text.text,
                                  _description_text.text,
                                  widget.userRef);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              height: postContainerHeight,
              color: Color(0xFF6F4E37),
            ),
            Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: PostList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
