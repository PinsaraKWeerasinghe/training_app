import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent {}

class LoginSubmit extends LoginEvent{
  String userName;

  LoginSubmit(this.userName);
}

class ErrorEvent extends LoginEvent {
  final String error;

  ErrorEvent(this.error);
}
