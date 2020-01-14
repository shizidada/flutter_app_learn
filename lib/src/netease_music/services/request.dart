import 'package:dio/dio.dart';

const baseUrl = "http://api.mtnhao.com";

BaseOptions options = BaseOptions(baseUrl: baseUrl);
Dio neteaseDio = Dio(options);
