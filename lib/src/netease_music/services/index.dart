import 'package:flutter_app_learn/src/netease_music/services/request.dart';
import 'package:flutter_app_learn/src/netease_music/services/request_url.dart';

class RequestUtil {
  // 登录
  static void getBanner(Map<String, dynamic> params,
      {Function success, Function failure}) {
    Request()
        .get(RequestUrl.BANNER_URL, params, success: success, failure: failure);
  }

  static void getSearchHot(Map<String, dynamic> params,
      {Function success, Function failure}) {
    Request().get(RequestUrl.SEARCH_HOT_URL, params,
        success: success, failure: failure);
  }

  static void getRecommendSong(Map<String, dynamic> params,
      {Function success, Function failure}) {
    Request().get(RequestUrl.RECOMMEND_SONG_URL, params,
        success: success, failure: failure);
  }

  static void getNewSong(Map<String, dynamic> params,
      {Function success, Function failure}) {
    Request().get(RequestUrl.NEW_SONG_URL, params,
        success: success, failure: failure);
  }

  static void getTopList(Map<String, dynamic> params,
      {Function success, Function failure}) {
    Request().get(RequestUrl.TOP_LIST_URL, params,
        success: success, failure: failure);
  }
}
