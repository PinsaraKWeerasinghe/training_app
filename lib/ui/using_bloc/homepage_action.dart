import 'package:flutter/cupertino.dart';

@immutable
abstract class HomePageAction{}

class SubmitAction extends HomePageAction{
  final String title;
  final String description;

  SubmitAction(this.title, this.description);
}

class LoardCardAction extends HomePageAction{

}