import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/config/index.dart';
import 'package:flutter_app_learn/src/utils/navigate_util.dart';
import 'package:flutter_app_learn/src/utils/share_util.dart';
import 'package:flutter_app_learn/src/utils/toast_util.dart';
import 'package:flutter_app_learn/src/widgets/input_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _accountController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _rememberPassword = false;

  @override
  void initState() {
    super.initState();

    _accountController.text = "admin";
    _passwordController.text = "123";
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
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Checkbox(
                                    value: _rememberPassword,
                                    checkColor: Colors.white,
                                    focusColor: Theme.of(context).primaryColor,
                                    activeColor: Theme.of(context).primaryColor,
                                    onChanged: (value) {
                                      this.setState(() {
                                        _rememberPassword = value;
                                      });
                                    }),
                                GestureDetector(
                                  child: Text(
                                    "记住密码",
                                    style: TextStyle(
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(30.0),
                                    ),
                                  ),
                                  onPanDown: (_) {
                                    this.setState(() {
                                      _rememberPassword = !_rememberPassword;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                        _buildLoginButton(),
                        _buildRegister(),
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
                "登录",
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

  Widget _buildRegister() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0, ScreenUtil.getInstance().setHeight(40.0), 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(16.0)),
            child: Text(
              '忘记密码?',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(30.0)),
            ),
          ),
          GestureDetector(
            child: Text(
              "注册",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil.getInstance().setSp(30.0)),
            ),
            onTap: () {
              NavigatorUtil.pushFromRight(context, "/register");
            },
          )
        ],
      ),
    );
  }
}
