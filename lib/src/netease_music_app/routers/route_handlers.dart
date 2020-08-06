import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/src/netease_music_app/pages/netesase_music_index_page.dart';

/// 网易云音乐 API
///
Handler neteaseMusicIndexHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return NeteaseMusicIndexPage();
});
