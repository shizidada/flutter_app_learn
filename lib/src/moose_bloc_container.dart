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
    return Container(
      child: buildWithBloc(context),
    );
  }

  Widget buildWithBloc(BuildContext context) {
    return BlocProvider(
        create: (_) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeData>(builder: (_, themeData) {
          return MaterialApp(
            title: 'Flutter App Learn',
            theme: themeData,
            home: MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) => DetailBloc(),
              ),
              BlocProvider(
                create: (context) =>
                    HomeBloc(detailBloc: BlocProvider.of<DetailBloc>(context)),
              )
            ], child: HomeScreen()),
            onGenerateRoute: Application.router.generator,
          );
        }));
  }
}
