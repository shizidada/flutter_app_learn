import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'routers/application.dart';
import 'routers/routers.dart';

///////////////////////////////////////////
// import "package:flutter_app_learn/views/home_page/home.dart";
// import "package:flutter_app_learn/views/welcome_page/welcome.dart";
// import "package:flutter_app_learn/views/welcome_page/welcome.bak.dart";
// import "package:flutter_app_learn/utils/share_util.dart";

class FlutterLearnApp extends StatelessWidget {
  FlutterLearnApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
        title: 'Flutter Learn App',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        // home: HomePage(title: '豆沙包'),
        // home: WelcomePage(),
        // Application.router.generator
        onGenerateRoute: (RouteSettings routeSettings) {
          RouteMatch match = Application.router.matchRoute(
              null, routeSettings.name,
              routeSettings: routeSettings,
              transitionType: TransitionType.inFromRight);
          return match.route;
        });

    print("initialRoute");
    print(materialApp.initialRoute);
    return materialApp;
  }
}

void main() => runApp(FlutterLearnApp());
