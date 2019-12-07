import 'package:dear_diary/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class EntryState extends Equatable {
  const EntryState();

  @override
  List<Object> get props => [];
}

//states for fetching entry
class EntryEmpty extends EntryState {}

class EntryLoading extends EntryState {}

class EntryLoaded extends EntryState {
  final List<Entry> entries;

  const EntryLoaded({@required this.entries}) : assert(entries != null);

  @override
  List<Object> get props => [entries];
}

class EntryError extends EntryState {}

//states for updating entry
class EntryUpdating extends EntryState {}

class EntryUpdated extends EntryState {}

class EntryUpdateError extends EntryState {}
