import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/blocs/home_bloc.dart';
import 'package:flutter_app_learn/src/bloc_app/blocs/login/login_bloc.dart';
import 'package:flutter_app_learn/src/bloc_app/blocs/login/login_event.dart';
import 'package:flutter_app_learn/src/bloc_app/blocs/login/login_state.dart';
import 'package:flutter_app_learn/src/bloc_app/blocs/theme_bloc.dart';
import 'package:flutter_app_learn/src/bloc_app/components/loading_dialog.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/detail_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/utils/density.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /// todo:
    Density.instance.init(context, 750, 750);
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, int>(
          listener: (context, state) {
            if (state % 2 == 0) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return LoadingDialog(
                      outsideDismiss: false,
                    );
                  });
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pop(context);
              });
            }
            print('HomeBloc BlocListener :: $state');
          },
        ),
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return LoadingDialog(
                      loadingText: '正在登录中...',
                      outsideDismiss: false,
                    );
                  });
            } else if (state is LoginSuccessState) {
              Navigator.pop(context);
              _toDetail();
            }
            print('LoginBloc BlocListener :: $state');
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('HomeScreen'),
        ),
        body: SafeArea(
            child: Container(
          child: Column(children: <Widget>[
            BlocBuilder<HomeBloc, int>(builder: (_, counter) {
              return Text('HomeScreen $counter');
            }),
            RaisedButton(
                child: Text('Detail'),
                onPressed: () {
                  _toDetail();
                }),
            RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context)..add(LoginLoadingEvent());
                })
          ]),
        )),
        floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  heroTag: 0,
                  onPressed: () =>
                      context.bloc<HomeBloc>().add(HomeEvent.increment),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: const Icon(Icons.remove),
                  heroTag: 1,
                  onPressed: () =>
                      context.bloc<HomeBloc>().add(HomeEvent.decrement),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: const Icon(Icons.lightbulb_outline),
                  heroTag: 3,
                  onPressed: () =>
                      context.bloc<ThemeBloc>().add(ThemeEvent.toggle),
                ),
              ),
            ]),
      ),
    );
  }

  _toDetail() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailScreen();
    }));
  }
}
