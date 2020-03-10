import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:trainingapp/db/model/PostModel.dart';
import 'package:trainingapp/db/repo/DiaryCardRepository.dart';

@immutable
class DiaryHomeState {
  final String error;
  final String userName;
  final String title;
  final String description;
  final int created;
  final List<Post> cardList;

  DiaryHomeState({
    @required this.error,
    @required this.userName,
    @required this.title,
    @required this.description,
    @required this.created,
    @required this.cardList,
  });

  DiaryHomeState clone({
    String error,
    String userName,
    String title,
    String description,
    int created,
    List<Post> cardList,
  }) {
    return DiaryHomeState(
      error: error ?? this.error,
      userName: userName ?? this.userName,
      title: title ?? this.title,
      description: description ?? this.description,
      created: created ?? this.created,
      cardList: cardList ?? this.cardList,
    );
  }
}
