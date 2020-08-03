import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/src/bloc_app/routers/route_handlers.dart';
import './route_handlers.dart';

class Routes {
  static String rootScreen = "app://";
  static String loginScreen = "app://login";
  static String sliverScreen = "app://sliver";
  static String staggeredGridViewScreen = "app://staggeredGridView";
  static String customBottomSheetScreen = "app://customBottomSheet";
  static String nineGridViewScreen = "app://nineGridView";
  static String singlePictureScreen = "app://singlePicture";
  static String dragSortScreen = "app://dragSort";
  static String cachedNetworkImageScreen = "app://cachedNetworkImage";
  static String flutterToastScreen = "app://flutterToast";
  static String flutteri18nScreen = "app://flutteri18n";
  static String flutterEasyRefreshScreen = "app://flutterEasyRefresh";
  static String convexAppBarScreen = "app://convexAppBar";
  static String flutterSlidableScreen = "app://flutterSlidable";

  static void configureRoutes(Router router) {
    router.define(rootScreen, handler: rootHandler);

    router.define(loginScreen, handler: loginHandler);

    router.define(sliverScreen, handler: sliverHandler);

    router.define(staggeredGridViewScreen, handler: staggeredGridViewHandler);

    router.define(customBottomSheetScreen, handler: customBottomSheetHandler);

    router.define(nineGridViewScreen, handler: nineGridViewHandler);

    router.define(singlePictureScreen, handler: singlePictureHandler);

    router.define(dragSortScreen, handler: dragSortHandler);

    router.define(cachedNetworkImageScreen, handler: cachedNetworkImageHandler);

    router.define(flutterToastScreen, handler: flutterToastHandler);

    router.define(flutteri18nScreen, handler: flutteri18nHandler);

    router.define(flutterEasyRefreshScreen, handler: flutterEasyRefreshHandler);

    router.define(convexAppBarScreen, handler: convexAppBarHandler);

    router.define(flutterSlidableScreen, handler: flutterSlidableHandler);
    
  }
}
