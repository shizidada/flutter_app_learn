import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_app_learn/src/pages/index_page.dart';
import 'package:flutter_app_learn/src/pages/login_page.dart';
import 'package:flutter_app_learn/src/pages/register_page.dart';
import 'package:flutter_app_learn/src/pages/detail_page.dart';

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});

Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

Handler registerHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegisterPage();
});

Handler detailHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String id = params['id']?.first;
  String title = params['title']?.first;
  String name = params['name']?.first;
  print(params);
  return DetailPage(
    id: int.parse(id),
    title: title,
    name: name,
  );
});
