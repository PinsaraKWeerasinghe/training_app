import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';

import 'home_page_action.dart';
import 'home_page_model.dart';

class HomePageBloc extends Bloc<HomePageAction, HomePageModel> {
  static final log = Log("HomePageBloc");

  HomePageBloc(BuildContext context){
    add(LoadAllCardAction());
  }

  @override
  HomePageModel get initialState => HomePageModel(
      titles: [],
    descriptions: [],
  );

  @override
  Stream<HomePageModel> mapEventToState(HomePageAction action) async* {
    switch (action.runtimeType) {
      case LoadCardAction:
        final title = (action as LoadCardAction).title;
        final titles = List.of(state.titles);
        titles.add(title);

        final description = (action as LoadCardAction).description;
        final descriptions = List.of(state.descriptions);
        descriptions.add(description);

        yield state.clone(titles: [],descriptions: []);
        yield state.clone(titles: titles, descriptions: descriptions);
        break;

      case LoadAllCardAction:
        final posts = await postRepo.querySingle(specification: ComplexSpecification([]));
        for (var list in posts) {
          final titles = List.of(state.titles);
          titles.add(list.title);

          final descriptions = List.of(state.descriptions);
          descriptions.add(list.description);

          yield state.clone(titles: titles, descriptions: descriptions);
        }

        break;
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    log.e('$error');
    log.e('$stacktrace');
  }
}
