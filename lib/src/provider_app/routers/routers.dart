import 'package:fluro/fluro.dart';
import './route_handlers.dart';

class Routes {
  static String rootPage = "/";
  static String loginPage = "/login";
  static String registerPage = "/register";
  static String detailPage = "/detail/:id/:title/:name";
  static String videoPage = "/video";
  static String contactListPage = "/contact/list";
  static String chatPage = "/chat/:userId/:username";

  static String keyboardActionsPage = "/keyboardActionsPage";

  static void configureRoutes(Router router) {
    router.define(rootPage, handler: rootHandler);
    router.define(loginPage, handler: loginHandler);
    router.define(registerPage, handler: registerHander);
    router.define(detailPage, handler: detailHander);
    router.define(videoPage, handler: videoPlayerHander);
    router.define(contactListPage, handler: contactListHander);
    router.define(chatPage, handler: chatHander);

    /// example demo
    router.define(keyboardActionsPage, handler: keyboardActionsHander);

  }
}
