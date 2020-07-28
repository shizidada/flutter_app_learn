import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/src/bloc_app/routers/route_handlers.dart';
import './route_handlers.dart';

class Routes {
  static String rootScreen = "app://";
  static String loginScreen = "app://login";
  static String sliverScreen = "app://sliver";
  static String staggeredGridViewScreen = "app://staggeredGridView";
  static String customBottomSheetScreen = "app://customBottomSheet";

  static void configureRoutes(Router router) {
    router.define(rootScreen, handler: rootHandler);

    router.define(loginScreen, handler: loginHandler);

    router.define(sliverScreen, handler: sliverHandler);

    router.define(staggeredGridViewScreen, handler: staggeredGridViewHandler);

    router.define(customBottomSheetScreen, handler: customBottomSheetHandler);
  }
}
