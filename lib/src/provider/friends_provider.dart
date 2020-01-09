import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/models/result.dart';
import 'package:flutter_app_learn/src/models/user_info_model.dart';
import 'package:flutter_app_learn/src/service/friends_service.dart';

class FriendsProvider with ChangeNotifier {
  List<UserInfoModel> friendsList = List<UserInfoModel>();

  FriendsProvider() {
    print(" ---- FriendsProvider ---- ");
    this.getFriendsList();
  }

  /// 获取 friend list
  getFriendsList() {
    getFriends().then((result) {
      Map userMap = json.decode(result.toString());
      Result<UserInfoModel> res = Result<UserInfoModel>.fromJson(userMap);
      friendsList = res.data;
      notifyListeners();
    }).catchError((error) {
      print('error $error');
    });
  }
}
