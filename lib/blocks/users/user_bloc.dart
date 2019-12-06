import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dear_diary/repositories/repositories.dart';
import 'package:flutter/material.dart';
import './user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({@required this.userRepository}) : assert(userRepository != null);

  @override
  UserState get initialState => UserNotUpdated();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is AddUser) {
      yield UserUpdating();
      try {
        final DocumentReference docRef =
            await userRepository.updateUserData(event.userName);
        yield UserUpdated(ref: docRef);
      } catch (_) {
        yield UserError();
      }
    }
  }
}
