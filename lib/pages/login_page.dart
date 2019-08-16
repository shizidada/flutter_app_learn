import 'package:flutter/material.dart';
import 'package:flutter_app_learn/config/colors.dart';
import 'package:flutter_app_learn/config/index.dart';
import 'package:flutter_app_learn/routers/application.dart';
import 'package:flutter_app_learn/utils/share_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _accountController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  login() {
    String account = _accountController.text.trim();
    if (account.isEmpty) {
      Fluttertoast.showToast(
          msg: '账号不能为空',
          backgroundColor: KColors.primaryColor,
          gravity: ToastGravity.CENTER);
      return;
    }
    String password = _passwordController.text.trim();
    if (password.isEmpty) {
      Fluttertoast.showToast(
          msg: '密码不能为空',
          backgroundColor: KColors.primaryColor,
          gravity: ToastGravity.CENTER);
      return;
    }
    print('$account $password');
    if (account == 'admin' && password == '123') {
      Application.router.navigateTo(context, "/");
      SharedUtil.putBool(KString.isLogin, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build .... ");

    return Scaffold(
      // 防止键盘弹出影响布局高度
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(5.0),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextField(
                      controller: _accountController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: "请输入账号",
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                    child: TextField(
                      controller: _passwordController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        icon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: "请输入密码",
                      ),
                      obscureText: true,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Checkbox(value: true, onChanged: (value) => {}),
                          Text("记住密码"),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: RaisedButton(
                            child: Text(
                              "登录",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              login();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "注册",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
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
