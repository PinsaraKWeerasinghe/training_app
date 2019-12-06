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
  final Entry entry;

  const EntryLoaded({@required this.entry}) : assert(entry != null);

  @override
  List<Object> get props => [entry];
}

class EntryError extends EntryState {}

//states for updating entry
class EntryUpdating extends EntryState {}

class EntryUpdated extends EntryState {}

class EntryUpdateError extends EntryState {}
