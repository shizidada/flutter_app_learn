import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScreen {
  static num setWidth(width) {
    return ScreenUtil().setWidth(width);
  }

  static num setHeight(height) {
    return ScreenUtil().setHeight(height);
  }

  static num fontSize(fontSize) {
    return ScreenUtil().setSp(fontSize);
  }

  static num width() {
    return ScreenUtil().scaleWidth;
  }

  static num heigth() {
    return ScreenUtil().scaleHeight;
  }
}
