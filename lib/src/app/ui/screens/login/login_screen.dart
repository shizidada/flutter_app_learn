import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_body.dart';

class ATHLoginScreen extends StatelessWidget {
  static final String routeName = "app://login";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.px),
          child: ATHLoginBody()),
    );
  }
}
