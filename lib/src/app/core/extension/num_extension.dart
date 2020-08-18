import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumExtension on num {
  num get px => ScreenUtil().setWidth(this);
}