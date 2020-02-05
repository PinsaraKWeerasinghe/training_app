import 'package:bloc/bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:training_app/db/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training_app/db/model/repo/repository.dart';


import 'homepage_action.dart';
import 'homepage_model.dart';

class HomePageBloc extends Bloc<HomePageAction, HomePageModel> {

  static final log  = Log("HomePageBloc");

  final postRepository = PostRepository();

  HomePageBloc(BuildContext context){
    add(LoardCardAction());
  }

  @override
  HomePageModel get initialState => HomePageModel(
    titles: [],
    descriptions: [],
  );

  @override
  Stream<HomePageModel> mapEventToState(HomePageAction action) async* {
    switch (action.runtimeType) {
      case  SubmitAction:
        final title = (action as SubmitAction).title;
        final titles = List.of(state.titles);
        titles.add(title);

        final description = (action as SubmitAction).description;
        final descriptions = List.of(state.descriptions);
        descriptions.add(description);

        await postRepository.add(item: Post(user: "isuri",title: title,description: description,created: Timestamp.now()));

        yield state.clone(titles: titles,descriptions: descriptions);
        break;

      case LoardCardAction:
        final posts = await postRepository.querySingle(specification: ComplexSpecification([]));
        for(var list in posts){
          final titles = List.of(state.titles);
          titles.add(list.title);

          final description = List.of(state.descriptions);
          description.add(list.description);

          yield state.clone(titles: titles,descriptions: description);
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