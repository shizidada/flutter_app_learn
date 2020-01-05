import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'src/config/index.dart';
import 'src/provider/current_index_provide.dart';
import 'src/pages/welcome_page.dart';
import 'src/routers/application.dart';
import 'src/routers/routers.dart';

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
        // debugShowCheckedModeBanner: false,
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
