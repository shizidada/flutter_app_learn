import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/config/colors.dart';

import 'package:provider/provider.dart';
import './provider/current_index_provide.dart';

import 'package:flutter_app_learn/pages/welcome_page.dart';

import 'routers/application.dart';
import 'routers/routers.dart';

void main() async {
  runApp(FlutterLearnApp());
  // FlutterLearnApp()
}

class FlutterLearnApp extends StatelessWidget {
  FlutterLearnApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => CurrentIndexProvide(),
        )
      ],
      child: Container(
        child: MaterialApp(
            title: 'Flutter Learn App',
            theme: ThemeData(primaryColor: KColors.primaryColor),
            home: WelcomePage(),
            onGenerateRoute: Application.router.generator),
      ),
    );
  }
}
