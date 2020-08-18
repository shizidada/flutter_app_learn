import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/src/app/ui/screens/discovery_detail/discovery_detail_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/main/main_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/message/message_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/search/search_screen.dart';

import 'route_handlers.dart';

class ATHRoutes {
  static void configureRoutes(Router router) {
    router.define(ATHMainScreen.routeName, handler: mainHandler);

    router.define(ATHMessageScreen.routeName, handler: messageHandler);

    router.define(ATHSearchScreen.routeName, handler: searchHandler);

    router.define(ATHDiscoveryDetailScreen.routeName, handler: discoveryDetailHandler);

  }
}
