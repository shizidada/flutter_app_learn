import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/src/app/screens/main_screen.dart';

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MainScreen();
});
