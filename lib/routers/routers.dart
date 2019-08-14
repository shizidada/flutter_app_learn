import 'package:fluro/fluro.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String login = "/login";
  static String detail = "/detail";
  static void configureRoutes(Router router) {
    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(detail, handler: detailHander);
  }
}
