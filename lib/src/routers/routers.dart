import 'package:fluro/fluro.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String login = "/login";
  static String register = "/register";
  static String detail = "/detail/:id/:title/:name";
  static void configureRoutes(Router router) {
    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHander);
    router.define(detail, handler: detailHander);
  }
}
