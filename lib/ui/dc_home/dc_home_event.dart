import 'package:flutter/material.dart';

@immutable
abstract class DiaryHomeEvent {}

class DiaryCardSubmitEvent extends DiaryHomeEvent{
  String title;
  String userName;
  String description;

  DiaryCardSubmitEvent(this.title,this.userName, this.description);
}

class CarListUpdateEvent extends DiaryHomeEvent{}

class ErrorEvent extends DiaryHomeEvent {
  final String error;

  ErrorEvent(this.error);
}
