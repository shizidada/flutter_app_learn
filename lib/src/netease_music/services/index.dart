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
    Request()
        .get(RequestUrl.SEARCH_HOT_URL, params, success: success, failure: failure);
  }
}
