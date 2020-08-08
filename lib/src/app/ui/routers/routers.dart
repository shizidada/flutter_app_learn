import 'package:fluro/fluro.dart';

import 'route_handlers.dart';

class ATHRoutes {
//  static String exampleScreen = "app://example";
  static String messageScreen = "app://message";
  static String searchScreen = "app://search";

  static void configureRoutes(Router router) {
//    router.define(exampleScreen, handler: exampleHandler);

    router.define(messageScreen, handler: messageHandler);

    router.define(searchScreen, handler: searchHandler);
  }
}
