import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

class Diary extends StatefulWidget {
  String name;
  Diary({this.name});

  @override
  _Diary createState() => _Diary(name);
}

class _Diary extends State<Diary> with TickerProviderStateMixin {
  String name;
  _Diary(this.name);
  var postContainerHeight = 0.0;
  var isExpanded = false;

  Animation _addAnimation;
  AnimationController _addAnimationController;

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
    return Scaffold(
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
                      onChanged: (text) {
                        name = text;
                      },
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
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onChanged: (text) {
                        name = text;
                      },
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Diary(name: name),
                          ));
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
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
