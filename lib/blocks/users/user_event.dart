import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class AddUser extends UserEvent {
  final String userName;

  const AddUser({@required this.userName}) : assert(userName != null);

  @override
  List<Object> get props => [userName];
}
