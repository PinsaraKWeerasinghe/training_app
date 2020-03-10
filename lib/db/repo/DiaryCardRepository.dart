import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:trainingapp/db/model/PostModel.dart';

class DiaryCardRepository extends FirebaseRepository<Post> {
  @override
  Post fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot == null) return null;
    final data = snapshot.data;
    if (data == null) return null;

    Post post=Post();
    post.user = data['user'];
    post.title = data['title'];
    post.description = data['description'];
    post.created = data['created'];

    return post;
  }

  @override
  Map<String, dynamic> toMap(Post item) {
    return {
      "user": item.user,
      "title": item.title,
      "description": item.description,
      "created": item.created,
    };
  }

  Future<void> addDiaryCard(
      {@required Post item, String type, DocumentReference parent}) {
    return super.add(item: item, type: "DiaryCards");
  }

  Future<void> addDiaryCardsList(
      {@required Iterable<Post> items, String type, DocumentReference parent}) {
    return super.addList(items: items, type: "DiaryCards");
  }

  @override
  Stream<List<Post>> query(
      {@required SpecificationI specification,
      String type,
      DocumentReference parent}) {
    return super.query(specification: specification, type: 'DiaryCards');
  }

  @override
  Future<List<Post>> querySingle(
      {@required SpecificationI specification,
      String type,
      DocumentReference parent}) {
    return super.querySingle(specification: specification, type: "DiaryCards");
  }

  @override
  Future<void> update(
      {@required Post item,
      String type,
      DocumentReference parent,
      MapperCallback<Post> mapper}) {
    return super
        .update(item: item, type: "DiaryCards", mapper: mapper, parent: parent);
  }
}
