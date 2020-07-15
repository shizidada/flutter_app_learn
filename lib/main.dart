import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/src/blocs/detail_bloc.dart';
import 'package:flutter_app_learn/src/blocs/home_bloc.dart';
import 'package:flutter_app_learn/src/blocs/theme_bloc.dart';
import 'package:flutter_app_learn/src/blocs/simple_bloc_observer.dart';
import 'package:flutter_app_learn/src/provider/chat_provider.dart';
import 'package:flutter_app_learn/src/provider/comment_provider.dart';
import 'package:flutter_app_learn/src/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'src/provider/index_provider.dart';
import 'src/provider/home_provider.dart';
import 'src/provider/favorite_provider.dart';

import 'src/provider/netease_music_provider.dart';
import 'src/routers/application.dart';
import 'src/routers/routers.dart';

import 'src/config/index.dart';

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
    return buildWithBloc(context);
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

  Widget buildWithProvider(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndexProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CommentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NeteaseMusicProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter App Learn',
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: MColors.alipayColor),
        // home: NeteaseMusicIndexPage(),
        home: HomeScreen(),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
