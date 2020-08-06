import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/src/app/routers/route_handlers.dart';

class Routes {
  static String rootScreen = "app://";

  static void configureRoutes(Router router) {
    router.define(rootScreen, handler: rootHandler);
  }
}
