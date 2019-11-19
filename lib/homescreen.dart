import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                top: (180                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             n),
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
                          fontFamily: 'AmericanTypewriter',
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
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: 'AmericanTypewriter',
                            fontWeight: FontWeight.normal,
                            color: Color(0xFFCFC6C0),
                          ),
                          hintText: 'Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            right: 10,
                            left: 10,
                            top: 5,
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
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF6F4E37),
                            ),
                          ),
                          onPressed: () {},
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
