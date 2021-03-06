import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/utils/navigator_util.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/screens/main/main_screen.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/input/input_field.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/round_button.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroll/scroller_configuration_wrapper.dart';

import 'widgets/login_forget_password.dart';
import 'widgets/login_third_part.dart';
import 'widgets/login_title.dart';

class ATHLoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ATHScrollerConfigurationWrapper(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250.px,
              margin: EdgeInsets.only(top: 150.px),
              child: CircleAvatar(
                backgroundColor: ATHColors.primaryColor,
                child: Text(
                  "ATH",
                  style: TextStyle(color: Colors.white),
                ),
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
                ATHNavigator.pushFadeInReplace(
                    context, ATHMainScreen.routeName);
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 24.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "还没有账号?",
                    style: TextStyle(color: ATHColors.color8c),
                  ),
                  SizedBox(width: 16.px),
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
      ),
    );
  }
}
