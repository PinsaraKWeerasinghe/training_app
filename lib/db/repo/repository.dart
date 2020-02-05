import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:training_app/db/model/post.dart';
import 'package:training_app/util/db_util.dart';

class PostRepository extends FirebaseRepository<Post>{
  @override
  Post fromSnapshot(DocumentSnapshot snapshot) {
    if(snapshot == null) return null;
    final data = snapshot.data;
    if(data == null ) return null;

    return Post(
      ref: snapshot.reference,
      user: data['user'] ?? "",
      title: data['title'] ?? "",
      description: data['description'] ?? "",
      created: data['created'],
    );
  }

  @override
  Map<String, dynamic> toMap(Post item) {
    return {
      'user':item.user,
      'title':item.title,
      'description':item.description,
      'created':item.created,
    };
  }

  @override
  Future<void> add({@required Post item, String type, DocumentReference parent}) {
    return super.add(item: item, type: DBUtil.POST,);
  }

 @override
  Future<List<Post>> querySingle({SpecificationI specification, String type, DocumentReference parent}) {
    return super.querySingle(specification:specification, type:DBUtil.POST,);
  }

}