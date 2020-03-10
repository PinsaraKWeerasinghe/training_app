import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:trainingapp/db/repo/DiaryCardRepository.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static final log = Log("LoginBloc");
  final _diaryCardRepository = DiaryCardRepository();
  LoginBloc(BuildContext context);

  @override
  LoginState get initialState => LoginState(
        error: '',
        userName: '',
    cardList: List(),
      );

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        log.e('Error: $error');
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case LoginSubmit:
        yield state.clone(userName: (event as LoginSubmit).userName,cardList: await _diaryCardRepository.querySingle(specification: ComplexSpecification([])));
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    log.e('$error');
    log.e('$stacktrace');
    _addErr(error);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    log.e('$e');
    try {
      add(ErrorEvent(
        (e is String)
            ? e
            : (e.message ?? "Something went wrong. Please try again !"),
      ));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again !"));
    }
  }
}
