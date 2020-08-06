import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

/// 网易云音乐 API
///
Handler neteaseMusicIndexHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return NeteaseMusicIndexPage();
});
