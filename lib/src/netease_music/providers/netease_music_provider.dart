import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/netease_music/models/banner_model.dart';
import 'package:flutter_app_learn/src/netease_music/models/search_hot_model.dart';
import 'package:flutter_app_learn/src/netease_music/services/index.dart';

class NeteaseMusicProvider with ChangeNotifier {
  BannerModel bannerModel;
  SearchHotModel searchHotModel;

  getBanner(params) {
    if (bannerModel == null)
      RequestUtil.getBanner(params, success: (data) {
        bannerModel = BannerModel.fromJson(data);
        notifyListeners();
      }, failure: (error) {
        print(error);
      });
  }

  getSearchHot(params) {
    if (searchHotModel == null)
      RequestUtil.getSearchHot(params, success: (data) {
        searchHotModel = SearchHotModel.fromJson(data);
        notifyListeners();
      }, failure: (error) {
        print(error);
      });
  }
}
