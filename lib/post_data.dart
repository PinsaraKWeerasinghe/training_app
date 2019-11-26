import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/post_tile.dart';

import 'models/posts.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<Posts>>(context);
    if (posts == null) {
      return CircularProgressIndicator();
    }
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostTile(
          post: posts[index],
        );
      },
    );
  }
}
