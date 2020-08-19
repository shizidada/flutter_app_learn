import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHLoginForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '忘记密码',
            style: TextStyle(color: ATHColors.primaryColor),
          ),
          Text('免密码登录', style: TextStyle(color: ATHColors.primaryColor)),
        ],
      ),
    );
  }
}