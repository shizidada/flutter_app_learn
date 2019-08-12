import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import "package:flutter_app_learn/views/home_page/home.dart";
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  bool _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  bool isFirst = false;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    // Navigator.of(context).pop();
    // Navigator.push(context, MaterialPageRoute(builder: (context) => new HomePage(title: "Home")));
    Navigator.pushNamedAndRemoveUntil(context, "home", (route) => route == null);
    // Navigator.pushAndRemoveUntil(context,
    //     new MaterialPageRoute(builder: (BuildContext context) {
    //   return HomePage();
    // }), (route) => route == null);


  }

  @override
  void initState() {
    print("initState");
    super.initState();

    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation = new CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(WelcomePage oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    // print(playerController);
    return Scaffold(
      // 防止键盘弹出影响布局高度
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: new Image.asset(
                    'assets/images/logo.png',
                    height: 25.0,
                    fit: BoxFit.scaleDown,
                  ))
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/logo.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // void _onEnterClick() {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => new HomePage(title: "Home")));
  // }
}
