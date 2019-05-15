import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/pages/home_page/home.dart';
import 'package:flutter_app_learn/pages/welcome_page/welcome.dart';
import 'package:flutter_app_learn/utils/share_util.dart';
import 'routers/application.dart';
import 'routers/routers.dart';

///////////////////////////////////////////
// import "package:flutter_app_learn/views/home_page/home.dart";
// import "package:flutter_app_learn/views/welcome_page/welcome.dart";
// import "package:flutter_app_learn/views/welcome_page/welcome.bak.dart";
// import "package:flutter_app_learn/utils/share_util.dart";
SpUtil sp;
class FlutterLearnApp extends StatelessWidget {
  FlutterLearnApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  showWelcomePage() {
    bool showWelcome = sp.getBool("showWelcome");
    print(showWelcome);
    if (showWelcome == null || showWelcome == false) {
      sp.putBool("showWelcome", true);
      return WelcomePage();
    } else {
      return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
        title: 'Flutter Learn App',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: showWelcomePage(),
        // home: WelcomePage(),
        // Application.router.generator
        onGenerateRoute: (RouteSettings routeSettings) {
          RouteMatch match = Application.router.matchRoute(
              null, routeSettings.name,
              routeSettings: routeSettings,
              transitionType: TransitionType.inFromRight);
          return match.route;
        });

    // print("initialRoute");
    // print(materialApp.initialRoute);
    return materialApp;
  }
}

void main() async {
  sp = await SpUtil.getInstance();
  runApp(FlutterLearnApp());
}
