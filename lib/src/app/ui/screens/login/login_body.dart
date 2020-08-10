import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/utils/navigator_util.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/screens/main/main_screen.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/input_field.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/round_button.dart';

import 'login_forget_password.dart';
import 'login_third_part.dart';
import 'login_title.dart';

class ATHLoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250.h,
            child: CircleAvatar(
              backgroundColor: ATHColors.primaryColor,
              child: Text("ATH"),
            ),
          ),
          ATHLoginTitle(),
          ATHInputFiled(labelTitle: "账号", hintText: "手机号/用户名/邮箱"),
          ATHInputFiled(
            labelTitle: "密码",
            hintText: "请输入密码",
          ),
          ATHLoginForgetPassword(),
          ATHRoundButton(
            text: "登录",
            press: () {
              ATHNavigator.pushFadeInReplace(context, ATHMainScreen.routeName);
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "还没有账号?",
                  style: TextStyle(color: ATHColors.colorbe),
                ),
                SizedBox(width: 16.w),
                Text(
                  "立即注册",
                  style: TextStyle(color: ATHColors.primaryColor),
                ),
              ],
            ),
          ),
          ATHLoginThirdPart()
        ],
      ),
    );
  }
}
