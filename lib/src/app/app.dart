import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/routers/application.dart';
import 'package:flutter_app_learn/src/app/ui/routers/routers.dart';
import 'package:flutter_app_learn/src/app/ui/screens/main/main_screen.dart';

class ATHApp extends StatelessWidget {
  ATHApp() {
    final router = Router();
    ATHRoutes.configureRoutes(router);
    ATHApplication.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return ATHAppContainer();
  }
}

class ATHAppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ATH App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: ATHColors.primaryColor),
      home: ATHMainScreen(),
      // home: LoginScreen(),
      onGenerateRoute: ATHApplication.router.generator,
    );
  }
}
