import 'package:flutter/material.dart';
import 'package:flutter_app_learn/config/index.dart';
import 'package:flutter_app_learn/utils/navigate_util.dart';
import 'package:flutter_app_learn/utils/share_util.dart';
import 'package:flutter_app_learn/utils/toast_util.dart';
import 'package:flutter_app_learn/widgets/login_input_item.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _accountController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _check = false;

  _loginHandle() {
    String account = _accountController.text.trim();
    if (account.isEmpty) {
      ToastUtil.showToast(message: KString.accountEmpty);
      return;
    }
    String password = _passwordController.text.trim();
    if (password.isEmpty) {
      ToastUtil.showToast(message: KString.passwordEmpty);
      return;
    }
    print('$account $password');
    if (account == 'admin' && password == '123') {
      NavigatorUtil.pushFadeInReplace(context, "/");
      SharedUtil.putBool(KString.isLogin, true);
    } else {
      ToastUtil.showToast(message: KString.accountPasswordError);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build .... ");

    return Scaffold(
        // 防止键盘弹出影响布局高度
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            // 触摸收起键盘
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: <Widget>[
                _buildBackgroud(),
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.only(left: 20, top: 380, right: 20),
                  child: Column(
                    children: <Widget>[
                      LoginItem(KString.accountHintText, Icon(Icons.person),
                          _accountController),
                      LoginItem(KString.passwordHintText, Icon(Icons.lock),
                          _passwordController),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                  value: _check,
                                  onChanged: (value) {
                                    this.setState(() {
                                      _check = value;
                                    });
                                  }),
                              Text("记住密码"),
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
            )));
  }

  Widget _buildBackgroud() {
    return Image.asset(
      "assets/images/login_bg.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildLoginButton() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 40,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: RaisedButton(
              color: KColors.primaryColor,
              child: Text(
                "登录",
                style: TextStyle(color: KColors.whiteColor),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: _loginHandle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRegister() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Text(
              '忘记密码?',
              textDirection: TextDirection.ltr,
              style: TextStyle(),
            ),
          ),
          GestureDetector(
            child: Text(
              "注册",
              style: TextStyle(color: Colors.black),
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

// Container(
//   height: 150,
//   child: Image.asset(
//     'assets/images/2.jpeg',
//     fit: BoxFit.cover,
//     width: MediaQuery.of(context).size.width,
//   ),
// ),
//             Container(
// //              height: MediaQuery.of(context).size.height,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   colorFilter: new ColorFilter.mode(
//                       Colors.black.withOpacity(0.1), BlendMode.dstATop),
//                   image: AssetImage('assets/images/mountains.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//  Expanded(
//             child: Container(
//               color: Colors.yellow,
//               padding: EdgeInsets.all(5.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   RaisedButton(
// //                    color: Colors.blue,
//                     onPressed: () => {},
//                     child: Text("RaisedButton"),
//                   ),
//                   OutlineButton(
//                     onPressed: () => {},
//                     child: Text("OutlineButton"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
