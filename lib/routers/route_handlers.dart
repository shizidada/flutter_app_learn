import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_app_learn/pages/index_page.dart';
import 'package:flutter_app_learn/pages/detail_page.dart';

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});

Handler detailHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DetailPage();
});
