import 'package:fluro/fluro.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String register = "/register";
  static String login = "/login";
  // static String detail = "/detail";
  static void configureRoutes(Router router) {
    router.define(root, handler: rootHandler);
    router.define(home, handler: homeHandler);
    router.define(register, handler: registerHander);
    // router.define(detail, handler: detailHander);
  }
}
