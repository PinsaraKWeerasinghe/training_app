import 'package:bloc/bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:training_app/using_bloc/homepage_action.dart';
import 'package:training_app/using_bloc/homepage_model.dart';

class HomePageBloc extends Bloc<HomePageAction, HomePageModel> {

  static final log  = Log("HomePageBloc");

  HomePageBloc(BuildContext context);

  @override
  HomePageModel get initialState => HomePageModel(
    titles: [],
    descriptions: [],
  );

  @override
  Stream<HomePageModel> mapEventToState(HomePageAction action) async* {
    switch (action.runtimeType) {
      case  LoardCardAction:
        final title = (action as LoardCardAction).title;
        final titles = List.of(state.titles);
        titles.add(title);

        final description = (action as LoardCardAction).description;
        final descriptions = List.of(state.descriptions);
        descriptions.add(description);

        yield state.clone(titles: [],descriptions: []);
        yield state.clone(titles: titles, descriptions: descriptions);
        break;
    }
  }
}