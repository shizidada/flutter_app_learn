import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_app_learn/src/config/index.dart';
import 'package:flutter_app_learn/src/utils/navigate_util.dart';
import 'package:flutter_app_learn/src/utils/share_util.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  startNavigationTime() async {
    Duration _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    bool isLogin = await SharedUtil.getBool(MStrings.isLogin);
    NavigatorUtil.pushFadeInReplace(context, isLogin ? '/' : '/login');
  }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);

    _animation.addListener(() => this.setState(() {}));
    _animationController.forward();

    // _animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animationController.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     _animationController.forward();
    //   }
    // });

    startNavigationTime();
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
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

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
              RotationTransition(
                turns:
                    Tween(begin: 0.0, end: 1.0).animate(_animationController),
                child: Padding(
                    padding: EdgeInsets.only(
                        bottom: ScreenUtil.getInstance().setHeight(25.0)),
                    child: Image.asset(
                      'assets/images/splash_logo.jpeg',
                      width: ScreenUtil.getInstance().setWidth(100.0),
                      height: ScreenUtil.getInstance().setHeight(100.0),
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: ScreenUtil.getInstance().setHeight(60.0)),
                  child: Text('Moose App'))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/splash_logo.jpeg',
                width:
                    _animation.value * ScreenUtil.getInstance().setWidth(600.0),
                height: _animation.value *
                    ScreenUtil.getInstance().setHeight(300.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
