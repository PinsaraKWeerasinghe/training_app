import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:trainingapp/db/model/PostModel.dart';
import 'package:trainingapp/db/repo/DiaryCardRepository.dart';

import 'dc_home_event.dart';
import 'dc_home_state.dart';

class DiaryHomeBloc extends Bloc<DiaryHomeEvent, DiaryHomeState> {
  static final log = Log("DiaryHomeBloc");
  final _diaryCardRepository = DiaryCardRepository();

  DiaryHomeBloc(BuildContext context);

  @override
  DiaryHomeState get initialState => DiaryHomeState(
        error: '',
        userName: '',
        title: '',
        description: '',
        created: 0,
        cardList: List(),
      );

  @override
  Stream<DiaryHomeState> mapEventToState(DiaryHomeEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        log.e('Error: $error');
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case DiaryCardSubmitEvent:
        DiaryCardSubmitEvent _subEvent = event as DiaryCardSubmitEvent;
        _diaryCardRepository.addDiaryCard(
          item: Post(
              user: _subEvent.userName,
              title: _subEvent.title,
              description: _subEvent.description,
              created: new DateTime.now().millisecondsSinceEpoch),
        );
        yield state.clone(
            title: _subEvent.title,
            userName: _subEvent.userName,
            description: _subEvent.description,
            cardList: await getCardList());
        break;
      case CarListUpdateEvent:
        yield state.clone(cardList: await getCardList());
        break;
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

  Future<List<Post>> getCardList() async {
    return _diaryCardRepository.querySingle(
        specification: ComplexSpecification([]));
  }

  Future<DiaryHomeState> init() async {
    return DiaryHomeState(
      error: '',
      userName: 'hardUser',
      title: '',
      description: '',
      created: 0,
      cardList: List(),
    ).clone(cardList: await getCardList());
  }

}
