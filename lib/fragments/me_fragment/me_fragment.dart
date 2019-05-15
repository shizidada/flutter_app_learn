import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_learn/pages/login_page/login.dart';

class MeFragment extends StatefulWidget {
  // MeFragment({Key key, this.globalKey}) : super(key: key);
  // final GlobalKey globalKey;

  @override
  State<StatefulWidget> createState() => _MeFragmentState();
}

class _MeFragmentState extends State<MeFragment> with AutomaticKeepAliveClientMixin {
  
  void _raisedButtonClick() {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => LoginPage()));
    // Navigator.pushReplacementNamed(context, "login");
    // Navigator.push<Object>(context,
    //     new MaterialPageRoute(builder: (BuildContext context) {
    //   return new LoginPage();
    // })).then((Object result) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       String str = result.toString();
    //       return new AlertDialog(
    //         content: new Text("您返回的内容为:$str"),
    //       );
    //     },
    //   );
    // });
  }

  // 跳转 LoginPage
  void _modalRouter() {
    Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (BuildContext context,
            Animation animation, Animation secondaryAnimation) {
          return LoginPage();
        }, transitionsBuilder:
            (___, Animation<double> animation, ____, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: RotationTransition(
              turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: child,
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Me"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text("This is the home page"),
            RaisedButton(
              child: Text(
                "RaisedButton",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: _raisedButtonClick,
            ),
            RaisedButton(
              child: Text(
                "Change to discover page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                // final FancyBottomNavigationState fState =
                //     widget.globalKey.currentState;
                // fState.setPage(2);
              },
            ),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, "register");
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => RegisterPage()));
              },
            ),
            OutlineButton(
              child: Text("Modal Router"),
              onPressed: _modalRouter,
            )
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
