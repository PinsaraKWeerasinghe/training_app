import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingapp/ui/dc_home/dc_home_provider.dart';

import 'login_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginView extends StatelessWidget {
  final log = Log("LoginView");

  bool _progressIndicatorHandler = false;
  static final loadingWidget = Center(
    child: CircularProgressIndicator(),
  );

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    var _controller = TextEditingController();

    log.d("Loading Login View");

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          color: Colors.lightBlueAccent,
          padding: EdgeInsets.all(10),
          child: _progressIndicatorHandler
              ? loadingWidget
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: Color(0xFF42A5F5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Enter Name'),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: BlocListener<LoginBloc, LoginState>(
                                listener: (context, state) {
                              if (state is LoginState) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DiaryHomeProvider(
                                        userName: state.userName,
                                        cardList: state.cardList,
                                      ),
                                    ));
                              }
                            }, child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return RaisedButton(
                                  color: Color(0xFF2962FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  onPressed: () {
                                    loginBloc
                                        .add(LoginSubmit(_controller.text));
                                  },
                                  child: Text("SUBMIT"),
                                );
                              },
                            )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
