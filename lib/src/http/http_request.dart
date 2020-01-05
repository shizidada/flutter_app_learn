import 'package:dio/dio.dart';

// 或者通过传递一个 `options`来创建dio实例
BaseOptions options = new BaseOptions(
    baseUrl: "https://api.github.com/users",
    connectTimeout: 5000,
    receiveTimeout: 10000);
Dio dio = new Dio(options);

// dio.options.baseUrl="https://www.xx.com/api";
