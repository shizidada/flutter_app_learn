import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/screens/category/category_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/discovery_detail/discovery_detail_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/main/main_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/message/message_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/search/search_screen.dart';

//Handler exampleHandler = Handler(
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//  return ATHExampleScreen();
//});

Handler mainHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ATHMainScreen();
});

Handler messageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ATHMessageScreen();
});

Handler searchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ATHSearchScreen();
});

Handler discoveryDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ATHDiscoveryDetailScreen();
});

Handler couponHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ATHCategoryScreen();
});
