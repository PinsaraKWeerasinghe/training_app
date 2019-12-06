import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/blocks/blocks.dart';
import 'package:dear_diary/repositories/repositories.dart';
import 'package:dear_diary/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryScreen extends StatefulWidget {
  final DocumentReference userRef;
  EntryRepository entryRepository = EntryRepository();
  EntryScreen({
    this.userRef,
  });
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen>
    with TickerProviderStateMixin {
  var postContainerHeight = 0.0;
  var isExpanded = false;

  final _titleText = TextEditingController();
  final _descriptionText = TextEditingController();

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
    return BlocProvider(
      create: (BuildContext context) =>
          EntryBloc(entryRepository: widget.entryRepository),
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
                  // BlocListener<EntryBloc, EntryState>(
                  //   listener: (context, state) {
                  //     if (state is EntryUpdated) {
                  //       print("Entry is Updated!");
                  //     }
                  //   },
                  // ),
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
                        controller: _titleText,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'American Typewriter',
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
                          fontFamily: 'American Typewriter',
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
                        controller: _descriptionText,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (text) {},
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'American Typewriter',
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
                          fontFamily: 'American Typewriter',
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
                              fontFamily: 'American Typewriter',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6F4E37),
                            ),
                          ),
                          onPressed: () {
                            if ((_titleText.text.isEmpty) ||
                                (_descriptionText.text.isEmpty)) {
                              showAlertDialog(context);
                            } else {
                              BlocProvider.of<EntryBloc>(context).add(AddEntry(
                                title: _titleText.text,
                                description: _descriptionText.text,
                                userRef: widget.userRef,
                              ));
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
                child: EntryList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
