import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

import 'login_body.dart';

class ATHLoginScreen extends StatelessWidget {
  static final String routeName = "app://login";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 150.w),
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          child: ATHLoginBody()),
    );
  }
}
