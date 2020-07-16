import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/blocs/detail_bloc.dart';
import 'package:flutter_app_learn/src/blocs/home_bloc.dart';
import 'package:flutter_app_learn/src/blocs/theme_bloc.dart';
import 'package:flutter_app_learn/src/routers/application.dart';
import 'package:flutter_app_learn/src/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MooseBlocContainer extends StatelessWidget {
  const MooseBlocContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildWithBloc(context);
  }

  Widget buildWithBloc(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (_, theme) {
        return MaterialApp(
          title: 'Flutter App Learn',
          theme: theme,
          home: buildHomeScreen(context),
          onGenerateRoute: Application.router.generator,
        );
      },
    );
  }

  BlocProvider<HomeBloc> buildHomeScreen(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(detailBloc: BlocProvider.of<DetailBloc>(context)),
      child: HomeScreen(),
    );
  }
}
