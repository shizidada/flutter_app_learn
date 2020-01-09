import 'dart:io';

import 'package:dio/dio.dart';

// 或者通过传递一个 `options`来创建dio实例
BaseOptions options = BaseOptions(
    baseUrl:
        Platform.isIOS ? "http://127.0.0.1:7000/" : "http://10.0.2.2:7000/",
    connectTimeout: 5000,
    receiveTimeout: 10000);
Dio dio = Dio(options);

// dio.options.baseUrl="https://www.xx.com/api";
