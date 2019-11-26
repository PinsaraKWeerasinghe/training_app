import 'package:flutter/material.dart';
import 'models/posts.dart';

class PostTile extends StatelessWidget {
  final Posts post;

  PostTile({this.post});

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
                  post.title,
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
                  post.description,
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
                  'By: ${post.user.name}',
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
