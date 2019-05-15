import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/pages/home_page/home.dart';

import 'package:flutter_app_learn/pages/login_page/login.dart';
import 'package:flutter_app_learn/pages/register_page/register.dart';
import 'package:flutter_app_learn/pages/welcome_page/welcome.dart';

/* 主界面 */
var rootHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new WelcomePage();
  },
);

// home 界面
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomePage();
  },
);

var loginHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

var registerHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegisterPage();
});

// var detailHander = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return DetailPage();
// });
