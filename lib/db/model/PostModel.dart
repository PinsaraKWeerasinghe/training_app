import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';

class Post extends DBModel {
  String user;
  String title;
  String description;
  int created;

  Post({
    @required this.user,
    @required this.title,
    @required this.description,
    @required this.created,
  });
}
