import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/screens/message/message_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/search/search_screen.dart';

//Handler exampleHandler = Handler(
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//  return ATHExampleScreen();
//});

Handler messageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ATHMessageScreen();
});

Handler searchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ATHSearchScreen();
});
