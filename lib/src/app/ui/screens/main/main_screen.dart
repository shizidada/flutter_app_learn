import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/screens/main/main_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 主页
class ATHMainScreen extends StatefulWidget {
  ATHMainScreen({Key key}) : super(key: key);

  @override
  _ATHMainScreenState createState() => _ATHMainScreenState();
}

class _ATHMainScreenState extends State<ATHMainScreen> {
  @override
  Widget build(BuildContext context) {
    //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 750, height: 1334);
    return ATHMainContent();
  }
}
