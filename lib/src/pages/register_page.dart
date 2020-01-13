import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/config/index.dart';
import 'package:flutter_app_learn/src/utils/navigate_util.dart';
import 'package:flutter_app_learn/src/utils/share_util.dart';
import 'package:flutter_app_learn/src/utils/toast_util.dart';
import 'package:flutter_app_learn/src/widgets/input_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _accountController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _accountController.text = "admin";
    // _passwordController.text = "123";
    // _rePasswordController.text = "123";
  }

  _loginHandle() {
    String account = _accountController.text.trim();
    if (account.isEmpty) {
      ToastUtil.showToast(message: MStrings.accountEmpty);
      return;
    }
    String password = _passwordController.text.trim();
    if (password.isEmpty) {
      ToastUtil.showToast(message: MStrings.passwordEmpty);
      return;
    }
    print('$account $password');
    if (account == 'admin' && password == '123') {
      NavigatorUtil.pushFadeInReplace(context, "/");
      SharedUtil.putBool(MStrings.isLogin, true);
    } else {
      ToastUtil.showToast(message: MStrings.accountPasswordError);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build .... ");

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(MStrings.registerTitle),
        ),
        // 防止键盘弹出影响布局高度
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              // 触摸收起键盘
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.all(ScreenUtil.getInstance().setWidth(32.0)),
                    margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance().setHeight(260.0)),
                    child: Column(
                      children: <Widget>[
                        InputItem(
                          hintText: MStrings.accountHintText,
                          icon: Icon(Icons.person),
                          controller: _accountController,
                        ),
                        InputItem(
                          hintText: MStrings.passwordHintText,
                          icon: Icon(Icons.lock),
                          controller: _passwordController,
                          obscureText: true,
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                        InputItem(
                          hintText: MStrings.rePasswordHintText,
                          icon: Icon(Icons.lock),
                          controller: _rePasswordController,
                          obscureText: true,
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                        _buildLoginButton(),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }

  Widget _buildLoginButton() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: ScreenUtil.getInstance().setHeight(82.0),
            margin: EdgeInsets.fromLTRB(
                0, ScreenUtil.getInstance().setHeight(20.0), 0, 0),
            child: RaisedButton(
              color: MColors.alipayColor,
              child: Text(
                MStrings.registerTitle,
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      ScreenUtil.getInstance().setHeight(8.0))),
              onPressed: _loginHandle,
            ),
          ),
        )
      ],
    );
  }
}
