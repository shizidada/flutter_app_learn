import 'package:dio/dio.dart';

import 'package:flutter_app_learn/src/netease_music/services/request.dart';

Future<Response> Function() getFriends = () => neteaseDio.get("/banner");
