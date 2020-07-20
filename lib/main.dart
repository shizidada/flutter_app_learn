import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/blocs/simple_bloc_observer.dart';
import 'package:flutter_app_learn/src/bloc_app/moose_bloc_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  runApp(MooseBlocApp());
}
