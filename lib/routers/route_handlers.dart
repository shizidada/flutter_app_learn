import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/pages/home.dart';

import 'package:flutter_app_learn/pages/login.dart';
import 'package:flutter_app_learn/pages/register.dart';
import 'package:flutter_app_learn/pages/webview.dart';
import 'package:flutter_app_learn/pages/welcome.dart';

/* 主界面 */
Handler rootHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new WelcomePage();
  },
);

// home 界面
Handler homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomePage();
  },
);

Handler loginHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

Handler registerHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegisterPage();
});

Handler webViewHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params["title"]?.first;
  String url = params["url"]?.first;
  print(params);
  return WebViewPage(title, url);
});

// var detailHander = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return DetailPage();
// });
