import 'package:flutter_app_learn/src/provider_app/res/index.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static showToast({message}) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: MColors.toastColor,
        gravity: ToastGravity.CENTER);
  }
}
