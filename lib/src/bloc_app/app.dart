
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/res/colors.dart';
import 'package:flutter_app_learn/src/bloc_app/routers/application.dart';
import 'package:flutter_app_learn/src/bloc_app/routers/routers.dart';

import 'screens/home_screen.dart';
import 'screens/sqflite_screen.dart';

class BlocApp extends StatelessWidget {
  BlocApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer();
  }
}

class AppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLOC App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MColors.primaryColor,
        fontFamily: 'PingFang',
      ),
//      home: HomeScreen(),
       home: SqfliteScreen(),
      // home: LoginScreen(),
      onGenerateRoute: Application.router.generator,
    );
  }
}