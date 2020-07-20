import 'package:flutter_app_learn/src/provider_app/http/http_request_manger.dart';
import 'package:flutter_app_learn/src/provider_app/http/request.dart';
import 'package:flutter_app_learn/src/provider_app/service/request_url.dart';

class RequestUtil {
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

  static void getFriendsList(Map<String, dynamic> params,
      {Function success, Function failure}) {
    RequestManager().get(RequestUrl.FRIENDS_LIST_URL, params,
        success: success, failure: failure);
  }
}
