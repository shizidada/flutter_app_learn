import 'package:fluro/fluro.dart';
import './route_handlers.dart';

class Routes {
  /// 网易云音乐
  static String neteaseMusicIndexPage = "/netease/music/index/page";

  static void configureRoutes(Router router) {
    /// 网易云音乐
    router.define(neteaseMusicIndexPage, handler: neteaseMusicIndexHander);
  }
}
