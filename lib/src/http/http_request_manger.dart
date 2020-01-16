import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_app_learn/src/utils/toast_util.dart';

enum Method { get, post }

class RequestManager {
  factory RequestManager() => _getInstance();
  static RequestManager get instance => _getInstance();
  static RequestManager _instance;

  Dio dio;
  RequestManager._internal() {
    // 初始化
    dio = Dio(BaseOptions(
        baseUrl:
            Platform.isIOS ? "http://127.0.0.1:7000/" : "http://10.0.2.2:7000/",
        connectTimeout: 5000,
        receiveTimeout: 10000));
  }

  // 单列模式
  static RequestManager _getInstance() {
    if (_instance == null) {
      _instance = RequestManager._internal();
    }
    return _instance;
  }

  get(String url, Map<String, dynamic> params,
      {Function success, Function failure}) {
    _doRequestManager(url, params, Method.get, success, failure);
  }

  post(String url, Map<String, dynamic> params,
      {Function success, Function failure}) {
    _doRequestManager(url, params, Method.post, success, failure);
  }

  void _doRequestManager(String url, Map<String, dynamic> params, Method method,
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

// dio.options.baseUrl="https://www.xx.com/api";
