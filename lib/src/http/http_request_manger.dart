import 'package:dio/dio.dart';

// 或者通过传递一个 `options`来创建dio实例
BaseOptions options = new BaseOptions(
    baseUrl: "http://10.0.2.2:7000/",
    connectTimeout: 5000,
    receiveTimeout: 10000);
Dio dio = new Dio(options);

// dio.options.baseUrl="https://www.xx.com/api";
