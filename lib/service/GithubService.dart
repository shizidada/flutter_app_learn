import 'package:flutter_app_learn/http/http_request.dart';

// 获取 started 列表
var getStarred = () => dio.get("/shizidada/starred");

// 获取用户信息
var getUsers = () => dio.get("/shizidada");

// 获取 following
var getFollowing = () => dio.get("/shizidada/following");

// 获取仓库
var getRepos = () => dio.get("/shizidada/repos");
