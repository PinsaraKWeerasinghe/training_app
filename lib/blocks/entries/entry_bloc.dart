import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dear_diary/models/models.dart';
import 'package:dear_diary/repositories/repositories.dart';
import 'package:flutter/material.dart';
import './entry.dart';

class EntryBloc extends Bloc<EntryEvent, EntryState> {
  final EntryRepository entryRepository;
  StreamSubscription _entriesSubscription;

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
      yield* _mapFetchEntriesToState();
    } else if (event is EntriesUpdated) {
      yield* _mapEntriesUpdatedToState(event);
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

  Stream<EntryState> _mapFetchEntriesToState() async* {
    _entriesSubscription?.cancel();
    _entriesSubscription = entryRepository
        .entries()
        .listen((entries) => add(EntriesUpdated(entries: entries)));
  }

  Stream<EntryState> _mapEntriesUpdatedToState(EntriesUpdated event) async* {
    yield EntryLoaded(entries: event.entries);
  }

  @override
  Future<void> close() {
    _entriesSubscription.cancel();
    return super.close();
  }
}
