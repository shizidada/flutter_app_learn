import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/routers/application.dart';

class NavigatorUtil {
  static push(context, path) {
    Application.router
        .navigateTo(context, path, transitionDuration: Duration(seconds: 1));
  }

  static pushFromRight(context, path) {
    Application.router
        .navigateTo(context, path, transition: TransitionType.inFromRight);
  }

  static pushFromRightDuration(context, path) {
    Application.router.navigateTo(context, path,
        transition: TransitionType.inFromRight,
        transitionDuration: Duration(seconds: 1));
  }

  static pushFadeIn(context, path) {
    Application.router.navigateTo(context, path,
        transition: TransitionType.fadeIn,
        transitionDuration: Duration(seconds: 1));
  }

  static pushFadeInReplace(context, path) {
    Application.router.navigateTo(context, path,
        replace: true,
        transition: TransitionType.fadeIn,
        transitionDuration: Duration(seconds: 1));
  }
}
