import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/src/example_demo/keyboard_actions_demo_page.dart';
import 'package:flutter_app_learn/src/netease_music/pages/netesase_music_index_page.dart';
import 'package:flutter_app_learn/src/pages/chat_page.dart';
import 'package:flutter_app_learn/src/pages/contact_list_page.dart';

import 'package:flutter_app_learn/src/pages/index_page.dart';
import 'package:flutter_app_learn/src/pages/login_page.dart';
import 'package:flutter_app_learn/src/pages/register_page.dart';
import 'package:flutter_app_learn/src/pages/detail_page.dart';
import 'package:flutter_app_learn/src/pages/video_player_page.dart';

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

Handler videoPlayerHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ViderPlayerPage();
});

Handler contactListHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ContactListPage();
});

Handler chatHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String userId = params['userId']?.first;
  String username = params['username']?.first;
  print("$params");
  return ChatPage(userId: userId, username: username);
});

/// example demo page router
Handler keyboardActionsHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return KeyboardActionsPage();
});

/// 
/// 
/// 
/// 
/// 
/// 
/// 
/// 
/// 
/// 网易云音乐 API
/// 
Handler neteaseMusicIndexHander = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return NeteaseMusicIndexPage();
});
