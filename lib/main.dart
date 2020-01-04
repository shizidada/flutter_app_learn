import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/config/index.dart';

import 'package:provider/provider.dart';
import 'provider/current_index_provide.dart';

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
          create: (context) => CurrentIndexProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Moose',
        theme: ThemeData(primaryColor: MColors.primaryColor),
        home: WelcomePage(),
        onGenerateRoute: Application.router.generator,
        // localizationsDelegates: [
        //   // 国际化
        //   FlutterI18nDelegate(
        //       useCountryCode: true,
        //       fallbackFile: 'zh_CN',
        //       path: 'assets/locale'),
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate
        // ],
      ),
    );
  }
}
