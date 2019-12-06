import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserNotUpdated extends UserState {}

class UserUpdating extends UserState {}

class UserUpdated extends UserState {
  final DocumentReference ref;

  const UserUpdated({@required this.ref}) : assert(ref != null);

  @override
  List<Object> get props => [ref];
}

class UserError extends UserState {}
