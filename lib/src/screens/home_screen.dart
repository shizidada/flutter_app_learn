import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/blocs/home_bloc.dart';
import 'package:flutter_app_learn/src/blocs/theme_bloc.dart';
import 'package:flutter_app_learn/src/screens/detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, int>(builder: (_, counter) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('HomeScreen'),
        ),
        body: SafeArea(
            child: Container(
          child: Column(children: <Widget>[
            Text('HomeScreen $counter'),
            RaisedButton(
                child: Text('Detail'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen();
                  }));
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
      );
    });
  }
}
