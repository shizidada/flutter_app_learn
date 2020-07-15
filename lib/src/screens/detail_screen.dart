import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/blocs/detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, int>(builder: (_, counter) {
      print('DetailScreen $counter');
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('DetailScreen'),
        ),
        body: SafeArea(
            child: Container(
          child: Column(children: <Widget>[
            Text('DetailScreen $counter'),
          ]),
        )),
      );
    });
  }
}
