import 'package:flutter/cupertino.dart';

@immutable
abstract class HomePageAction{}

class LoardCardAction extends HomePageAction{
  final String title;
  final String description;

  LoardCardAction(this.title, this.description);
}
