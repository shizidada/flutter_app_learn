import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/screens/main/main_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 主页
class ATHMainScreen extends StatelessWidget {
  static final String routeName = "app://main";

  @override
  Widget build(BuildContext context) {
    //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 750, height: 1334);
    return ATHMainBody();
  }
}
