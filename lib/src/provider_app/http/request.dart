import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app_learn/src/provider_app/utils/toast_util.dart';

// BaseOptions options = BaseOptions();
// Dio neteaseDio = Dio(options);

enum Method { get, post }

class Request {
  factory Request() => _getInstance();
  static Request get instance => _getInstance();
  static Request _instance;
  static String baseUrl = "http://api.mtnhao.com";

  Dio dio;
  Request._internal() {
    // 初始化
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 60000, // 连接服务器超时时间，单位是毫秒.
      receiveTimeout: 10000, // 响应流上前后两次接受到数据的间隔，单位为毫秒, 这并不是接收数据的总时限.
    ));
  }

  // 单列模式
  static Request _getInstance() {
    if (_instance == null) {
      _instance = Request._internal();
    }
    return _instance;
  }

  get(String url, Map<String, dynamic> params,
      {Function success, Function failure}) {
    _doRequest(url, params, Method.get, success, failure);
  }

  post(String url, Map<String, dynamic> params,
      {Function success, Function failure}) {
    _doRequest(url, params, Method.post, success, failure);
  }

  void _doRequest(String url, Map<String, dynamic> params, Method method,
      Function successCallBack, Function failureCallBack) async {
    try {
      Response response;
      switch (method) {
        case Method.get:
          if (params != null && params.isNotEmpty) {
            response = await dio.get(url, queryParameters: params);
          } else {
            response = await dio.get(url);
          }
          break;
        case Method.post:
          if (params != null && params.isNotEmpty) {
            response = await dio.post(url, queryParameters: params);
          } else {
            response = await dio.post(url);
          }
          break;
      }
      Map<String, dynamic> result = json.decode(response.toString());
      // 打印信息
      // print('''api: $url\nparams: $params\nresult: $result''');
      if (result['code'] == 200) {
        // 200 请求成功
        if (successCallBack != null) {
          //返回请求数据
          successCallBack(result);
        }
      } else {
        /// todo
        /// 直接使用Toast弹出错误信息
        /// 返回失败信息
        if (failureCallBack != null) {
          failureCallBack(result);
        }
      }
    } catch (exception) {
      print('错误：${exception.toString()}');
      ToastUtil.showToast(message: "请求失败，请稍后再试");
      if (failureCallBack != null) {
        failureCallBack(exception.toString());
      }
    }
  }
}
