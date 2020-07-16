import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/src/blocs/detail_bloc.dart';
import 'package:flutter_app_learn/src/blocs/simple_bloc_observer.dart';
import 'package:flutter_app_learn/src/blocs/theme_bloc.dart';
import 'package:flutter_app_learn/src/moose_bloc_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/routers/application.dart';
import 'src/routers/routers.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  runApp(MooseApp());
}

class MooseApp extends StatelessWidget {
  MooseApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
        BlocProvider(
          create: (_) => DetailBloc(),
        ),
      ],
      child: MooseBlocContainer(),
    );
  }
}
