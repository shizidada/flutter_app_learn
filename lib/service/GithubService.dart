import 'package:flutter_app_learn/http/http.dart';

var getStarred =
    () => dio.get("https://api.github.com/users/shizidada/starred");
