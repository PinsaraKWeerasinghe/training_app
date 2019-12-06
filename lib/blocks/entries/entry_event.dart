import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class EntryEvent extends Equatable {
  const EntryEvent();
}

class AddEntry extends EntryEvent {
  final String title;
  final String description;
  final DocumentReference userRef;

  const AddEntry({
    @required this.title,
    @required this.description,
    @required this.userRef,
  }) : assert(title != null, description != null);

  @override
  List<Object> get props => [title, description];
}

class FetchEntry extends EntryEvent {
  final String title;
  final String description;

  const FetchEntry({@required this.title, @required this.description})
      : assert(title != null, description != null);

  @override
  List<Object> get props => [title, description];
}
