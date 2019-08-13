import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:provide/provide.dart';
import './provider/current_index_provide.dart';

import 'package:flutter_app_learn/pages/index_page.dart';
import 'package:flutter_app_learn/utils/share_util.dart';

import 'routers/application.dart';
import 'routers/routers.dart';

///////////////////////////////////////////
// import "package:flutter_app_learn/views/home_page/home.dart";
// import "package:flutter_app_learn/views/welcome_page/welcome.dart";
// import "package:flutter_app_learn/views/welcome_page/welcome.bak.dart";
// import "package:flutter_app_learn/utils/share_util.dart";
SpUtil sp;

void main() async {
  sp = await SpUtil.getInstance();

  var currentIndexProvide = CurrentIndexProvide();
  var providers = Providers();

  providers..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));

  runApp(ProviderNode(
    child: FlutterLearnApp(),
    providers: providers,
  ));
  // FlutterLearnApp()
}

class FlutterLearnApp extends StatelessWidget {
  // showWelcomePage() {
  //   bool showWelcome = sp.getBool("showWelcome");
  //   print(showWelcome);
  //   if (showWelcome == null || showWelcome == false) {
  //     sp.putBool("showWelcome", true);
  //     return WelcomePage();
  //   } else {
  //     return IndexPage();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    return Container(
      child: MaterialApp(
          title: 'Flutter Learn App',
          theme: ThemeData(
            primaryColor: Colors.red,
          ),
          home: IndexPage(),
          onGenerateRoute: Application.router.generator),
    );
  }
}
