import 'package:dear_diary/models/models.dart';
import 'package:flutter/material.dart';

class EntryTile extends StatelessWidget {
  final Entry entry;

  EntryTile({this.entry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF6F4F3),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  entry.title,
                  style: TextStyle(
                    color: Color(0xFF6F4E37),
                    fontFamily: 'AmericanTypewriter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  entry.description,
                  style: TextStyle(
                    color: Color(0xFF6F4E37),
                    fontFamily: 'AmericanTypewriter',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'By: ${entry.user.name}',
                  style: TextStyle(
                    color: Color(0xFF6F4E37),
                    fontFamily: 'AmericanTypewriter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
