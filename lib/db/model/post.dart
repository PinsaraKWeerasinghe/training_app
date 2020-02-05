import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';

class Post extends DBModel{
  final String user;
  final String title;
  final String description;
  final Timestamp created;

  Post({DocumentReference ref,this.user, this.title, this.description, this.created}) : super(ref : ref);


}