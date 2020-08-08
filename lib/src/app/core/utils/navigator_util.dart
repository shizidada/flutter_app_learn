import 'package:fluro/fluro.dart';
import 'package:flutter_app_learn/src/app/ui/routers/application.dart';

class ATHNavigator {
  ATHNavigator._();

  static Duration duration = Duration(milliseconds: 100);

  static push(context, path) {
    ATHApplication.router
        .navigateTo(context, path, transitionDuration: duration);
  }

  static pop(context) {
    ATHApplication.router.pop(context);
  }

  static pushFromRight(context, path) {
    ATHApplication.router.navigateTo(context, path,
        transition: TransitionType.inFromRight, transitionDuration: duration);
  }

  static pushFromRightDuration(context, path) {
    ATHApplication.router.navigateTo(context, path,
        transition: TransitionType.inFromRight, transitionDuration: duration);
  }

  static pushFadeIn(context, path) {
    ATHApplication.router.navigateTo(context, path,
        transition: TransitionType.fadeIn, transitionDuration: duration);
  }

  static pushFadeInReplace(context, path) {
    ATHApplication.router.navigateTo(context, path,
        replace: true,
        transition: TransitionType.fadeIn,
        transitionDuration: duration);
  }
}
