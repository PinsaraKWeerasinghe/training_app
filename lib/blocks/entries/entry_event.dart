import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/models/models.dart';
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
  @override
  List<Object> get props => [];
}

class EntriesUpdated extends EntryEvent {
  final List<Entry> entries;

  const EntriesUpdated({
    @required this.entries,
  }) : assert(
          entries != null,
        );
  @override
  List<Object> get props => [entries];
}
