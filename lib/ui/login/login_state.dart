import 'package:flutter/material.dart';
import 'package:trainingapp/db/model/PostModel.dart';

@immutable
class LoginState {
  final String error;
  String userName;
  List<Post> cardList;

  LoginState({
    @required this.error,
    @required this.userName,
    @required this.cardList,
  });

  LoginState clone({
    String error,
    String userName,
    List<Post> cardList,
  }) {
    return LoginState(
      error: error ?? this.error,
      userName: userName,
      cardList: cardList,
    );
  }
}
