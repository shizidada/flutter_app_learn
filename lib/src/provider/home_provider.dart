import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<Tab> appBarTabs = <Tab>[
    Tab(
      text: "精选",
    ),
    Tab(
      text: "爱看",
    ),
    Tab(
      text: "电视剧",
    ),
    Tab(
      text: "电影",
    ),
    Tab(
      text: "综艺",
    ),
    Tab(
      text: "少儿",
    ),
    Tab(
      text: "动漫",
    ),
    Tab(
      text: "NBA",
    ),
    Tab(
      text: "纪录片",
    ),
  ];
}
