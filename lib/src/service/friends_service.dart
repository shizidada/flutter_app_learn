import 'package:dio/dio.dart';
import 'package:flutter_app_learn/src/http/http_request_manger.dart';

Future<Response> Function() getFriends = () => dio.get("friends/list");
