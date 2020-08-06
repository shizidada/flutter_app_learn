import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/routers/application.dart';
import 'package:flutter_app_learn/src/app/res/values/colors.dart';
import 'package:flutter_app_learn/src/app/routers/routers.dart';
import 'package:flutter_app_learn/src/app/screens/main_screen.dart';

class MyApp extends StatelessWidget {
  MyApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MyAppContainer();
  }
}

class MyAppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Learn',
      theme: ThemeData(primaryColor: AppColors.kPrimaryColor),
      home: MainScreen(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
