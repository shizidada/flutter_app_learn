import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_learn/config/index.dart';
import 'package:flutter_app_learn/routers/application.dart';
import 'package:flutter_app_learn/utils/share_util.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  bool _visible = true;
  AnimationController _animationController;
  Animation<double> _animation;

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    bool isLogin = await SharedUtil.getBool(KString.isLogin);
    Application.router.navigateTo(context, isLogin ? '/' : '/login',
        transition: TransitionType.fadeIn,
        transitionDuration: Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);

    _animation.addListener(() => this.setState(() {}));
    _animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(WelcomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(playerController);
    return Scaffold(
      // 防止键盘弹出影响布局高度
      resizeToAvoidBottomPadding: false,
      // backgroundColor: Colors.grey,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Image.asset(
                    'assets/images/splash_logo.jpeg',
                    height: 25.0,
                    fit: BoxFit.scaleDown,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/splash_logo.jpeg',
                width: _animation.value * 600,
                height: _animation.value * 300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
