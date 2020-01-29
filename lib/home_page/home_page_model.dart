import 'package:flutter/material.dart';

@immutable
class HomePageModel {
  final List<String> titles;
  final List<String> descriptions;

  HomePageModel({
    @required this.titles,
    @required this.descriptions,
  });

  HomePageModel clone({
    List<String> titles,
    List<String> descriptions,
  }) {
    return HomePageModel(
      titles:  titles ?? this.titles,
      descriptions: descriptions ?? this.descriptions,
    );
  }
}
