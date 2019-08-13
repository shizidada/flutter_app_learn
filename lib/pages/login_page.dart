import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _loginPage() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new LoginPage()));
  }

  void _registerPage() {
    Navigator.pushNamed(context, "register");
    // Navigator.push(context,
    //     new MaterialPageRoute(builder: (context) => new RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    print("build .... ");

    TextEditingController accountController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
      ),
      // 防止键盘弹出影响布局高度
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                child: Image.network(
              "https://p1.ssl.qhmsg.com/dr/220__/t01d5ccfbf9d4500c75.jpg",
              // width: 800,
              // height: 800,
              fit: BoxFit.fill, // 填充满
            )),
            flex: 1,
          ),
          Expanded(
            child: Container(
//              color: Colors.green,
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: TextField(
                      controller: accountController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
//                          gapPadding: 100,
//                          borderRadius: BorderRadius.circular(10.0)
                            ),
                        labelText: "请输入账号",
//                        helperText: "请输入账号"
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          gapPadding: 10,
//                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        labelText: "请输入密码",
//                        helperText: "请输入账号"
                      ),
                      obscureText: true,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Checkbox(value: true, onChanged: (value) => {}),
                          Text("记住密码"),
                        ],
                      ),
                      OutlineButton(
//                          color: Colors.blue,
                          onPressed: () => {},
                          child: Text("Login"))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      OutlineButton(
                        onPressed: () => _registerPage(),
                        child: Text("Register"),
                      ),
                    ],
                  )
                ],
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
//                    color: Colors.blue,
                    onPressed: () => _loginPage(),
                    child: Text("RaisedButton"),
                  ),
                  OutlineButton(
                    onPressed: () => _registerPage(),
                    child: Text("OutlineButton"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(5.0),
            ),
          ),
        ],
      ),
    );
  }
}
