import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/models/favorite_item_info.dart';

class FavoriteProvider extends ChangeNotifier {
  List<FavoriteInfo> favorites = List<FavoriteInfo>();

  getFavorateInfos() {
    favorites.add(FavoriteInfo(
        name: "Geamy-",
        title: "句号牛批啊woc！！！！",
        avatar: "http://p1.music.126.net/LzQe8IZgDREemLdsf9n_rg==/109951164601531195.jpg?param=180y180"));
    favorites.add(FavoriteInfo(
        name: "句号: 还有来送人头的吗",
        title: "Nightprincess",
        avatar: "http://p1.music.126.net/L9akiy-VNCI2J1zF3XXpOg==/109951164514269048.jpg?param=180y180"));
    favorites.add(FavoriteInfo(
        name: "流星儿ya",
        title: "又骄傲了我，句号牛逼",
        avatar: "http://p1.music.126.net/Z6SH0I9bkhsfz0WvkM3OjQ==/109951163823889671.jpg?param=180y180"));
  }
}
