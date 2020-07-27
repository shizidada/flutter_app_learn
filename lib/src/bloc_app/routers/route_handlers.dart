import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/custom_bottom_sheet_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/detail_screen.dart';
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

Handler detailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DetailScreen();
});

Handler staggeredGridViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return StaggeredGridViewScreen();
});

Handler customBottomSheetHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CustomBottomSheetScreen();
});
