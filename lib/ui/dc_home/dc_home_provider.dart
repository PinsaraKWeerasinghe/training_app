import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingapp/db/model/PostModel.dart';

import 'dc_home_bloc.dart';
import 'dc_home_view.dart';

class DiaryHomeProvider extends BlocProvider<DiaryHomeBloc> {
  DiaryHomeProvider({
    String userName,
    List<Post> cardList,
    Key key,
  }) : super(
          key: key,
          create: (context) => DiaryHomeBloc(context),
          child: DiaryHomeView(userName,cardList),
        );
}
