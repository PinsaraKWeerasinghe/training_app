import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dear_diary/models/models.dart';
import 'package:dear_diary/repositories/repositories.dart';
import 'package:flutter/material.dart';
import './entry.dart';

class EntryBloc extends Bloc<EntryEvent, EntryState> {
  final EntryRepository entryRepository;

  EntryBloc({@required this.entryRepository});

  @override
  EntryState get initialState => EntryEmpty();

  @override
  Stream<EntryState> mapEventToState(
    EntryEvent event,
  ) async* {
    if (event is AddEntry) {
      yield* _mapAddEntriesToState(event);
    } else if (event is FetchEntry) {
      yield* _mapFetchEntriesToState(event);
    }
  }

  Stream<EntryState> _mapAddEntriesToState(AddEntry event) async* {
    yield EntryUpdating();
    try {
      await entryRepository.updateEntries(
        event.title,
        event.description,
        event.userRef,
      );
      yield EntryUpdated();
    } catch (_) {
      yield EntryUpdateError();
    }
  }

  Stream<EntryState> _mapFetchEntriesToState(FetchEntry event) async* {}
}
