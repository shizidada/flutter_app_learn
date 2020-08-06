import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/netease_music_app/models/banner_model.dart';
import 'package:flutter_app_learn/src/netease_music_app/models/new_song_model.dart';
import 'package:flutter_app_learn/src/netease_music_app/models/recommend_model.dart';
import 'package:flutter_app_learn/src/netease_music_app/models/search_hot_model.dart';
import 'package:flutter_app_learn/src/netease_music_app/models/top_list_model.dart';
import 'package:flutter_app_learn/src/netease_music_app/services/index.dart';

class NeteaseMusicProvider with ChangeNotifier {
  BannerModel bannerModel;

  SearchHotModel searchHotModel;

  RecommendModel recommendModel;

  NewSongModel newSongModel;

  TopListModel topListModel;

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

  /// 推荐歌单
  getRecommendSong(params) {
    if (recommendModel == null)
      RequestUtil.getRecommendSong(params, success: (data) {
        recommendModel = RecommendModel.fromJson(data);
        notifyListeners();
      }, failure: (error) {
        print(error);
      });
  }

  getNewSong(params) {
    if (newSongModel == null)
      RequestUtil.getNewSong(params, success: (data) {
        newSongModel = NewSongModel.fromJson(data);
        notifyListeners();
      }, failure: (error) {
        print(error);
      });
  }

  getTopList(params) {
    if (topListModel == null)
      RequestUtil.getTopList(params, success: (data) {
        topListModel = TopListModel.fromJson(data);
        notifyListeners();
      }, failure: (error) {
        print(error);
      });
  }
}
