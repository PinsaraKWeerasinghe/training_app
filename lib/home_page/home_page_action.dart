import 'package:flutter/material.dart';

@immutable
abstract class HomePageAction{}

class LoadCardAction extends HomePageAction{
  final String title;
  final String description;

  LoadCardAction(this.title,this.description);
}