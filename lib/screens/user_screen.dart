import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:dear_diary/blocks/blocks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String name;
  final _text = TextEditingController();
  DocumentReference userRef;

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
      title: Text("Empty Name"),
      content: Text("Name cannot be empty"),
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFF6F4E37),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
              child: Text(
                "Dear Diar",
                style: TextStyle(
                  color: Color(0xFFCFC6C0),
                  fontFamily: 'Nightcall',
                  fontSize: 48,
                ),
              ),
            ),
          ),
          Container(
            height: (3 * MediaQuery.of(context).size.height) / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(MediaQuery.of(context).size.width / 4),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(
                top: 130,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Text(
                        'What is your name?',
                        style: TextStyle(
                          color: Color(0xFF6F4E37),
                          fontFamily: 'American Typewriter',
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
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
                        controller: _text,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'American Typewriter',
                            fontWeight: FontWeight.normal,
                            color: Color(0xFFCFC6C0),
                          ),
                          hintText: 'Name',
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
                    child: BlocListener<UserBloc, UserState>(
                      listener: (context, state) {
                        if (state is UserUpdated) {
                          userRef = state.ref;
                          print(userRef.documentID);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EntryScreen(
                              userRef: userRef,
                            ),
                          ));
                        }
                      },
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
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF6F4E37),
                              ),
                            ),
                            onPressed: () async {
                              if (_text.text.isEmpty) {
                                showAlertDialog(context);
                              } else {
                                BlocProvider.of<UserBloc>(context)
                                    .add(AddUser(userName: name));
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
