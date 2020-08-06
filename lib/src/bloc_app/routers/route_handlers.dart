import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/cached_network_image_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/convex_bottom_bar_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/custom_bottom_sheet_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/drag_sort_page.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/flutter_easyrefresh/flutter_easyrefresh_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/flutter_i18n_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/flutter_toast_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/flutter_slidable_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/nine_grid_view/nine_grid_view_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/nine_grid_view/single_picture_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/sliver_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/home_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/login_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/staggered_grid_view_screen.dart';

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeScreen();
});

Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginScreen();
});

Handler sliverHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SliverScreen();
});

Handler staggeredGridViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return StaggeredGridViewScreen();
});

Handler customBottomSheetHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CustomBottomSheetScreen();
});

Handler nineGridViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return NineGridViewScreen();
});

Handler singlePictureHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SinglePictureScreen();
});

Handler dragSortHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DragSortScreen();
});

Handler cachedNetworkImageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CachedNetworkImageScreen();
});

Handler flutterToastHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FlutterToastScreen();
});

Handler flutteri18nHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Flutteri18nScreen();
});

Handler flutterEasyRefreshHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FlutterEasyRefreshScreen();
});

Handler convexAppBarHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ConvexAppBarScreen();
});

Handler flutterSlidableHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FlutterSlidableScreen();
});
