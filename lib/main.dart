import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'diary_card.dart';
import 'form_card.dart';

void main() => runApp(Diary());

class Diary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                FormCard(),
                DiaryCard(
                    "Reasons Why Learning English is so Important",
                    'Noah',
                    'English may not be the most spoken language in the world, but it is the offcial language of 53 countries and spoken...English may not be the most spoken language in the world, but it is the offcial language of 53 countries and spoken...',
                    Colors.orange),
                DiaryCard(
                    "ABCD",
                    'efgh',
                    'njdajdbvhjbdvjhbjvnklkd bvhdivbhd ijdhvjnkvlkc',
                    Colors.lightGreen),
                DiaryCard(
                    "EFGH",
                    'efgh',
                    'njdajdbvhjbdvjhbjvnklkd bvhdivbhd ijdhvjnkvlkc',
                    Colors.indigo),
                DiaryCard(
                    "IJKL",
                    'efgh',
                    'njdajdbvhjbdvjhbjvnklkd bvhdivbhd ijdhvjnkvlkc njdajdbvhjbdvjhbjvnklkd bvhdivbhd ijdhvjnkvlkc njdajdbvhjbdvjhbjvnklkd bvhdivbhd ijdhvjnkvlkc njdajdbvhjbdvjhbjvnklkd bvhdivbhd ijdhvjnkvlkc njdajdbvhjbdvjhbjvnklkd bvhdivbhd ijdhvjnkvlkc njdajdbvhjbdvjhbjvnklkd bvhd',
                    Colors.pink),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
