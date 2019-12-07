import 'package:dear_diary/blocks/blocks.dart';
import 'package:dear_diary/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'screens/screens.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  final UserRepository userRepository = UserRepository();
  final EntryRepository entryRepository = EntryRepository();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App(
    userRepository: userRepository,
    entryRepository: entryRepository,
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;
  final EntryRepository entryRepository;

  App({Key key, @required this.userRepository, @required this.entryRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(userRepository: userRepository),
        ),
        BlocProvider<EntryBloc>(
          create: (context) => EntryBloc(entryRepository: entryRepository),
        )
      ],
      child: MaterialApp(
        title: "Dear Diary",
        home: UserScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
