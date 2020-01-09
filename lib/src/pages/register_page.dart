import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/config/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    ScreenUtil sc = ScreenUtil.getInstance();
    return Scaffold(
      appBar: new AppBar(
        title: new Text(MStrings.registerTitle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: ClipPath(
            clipper: RegisterClipper(),
            child: Container(
                height: sc.setHeight(200.0),
                // width: ScreenUtil.screenWidth,
                color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}

class RegisterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print(size);
    Path path = Path();

    /// path.lineTo(0, 0); //第1个点
    /// path.lineTo(0, size.height - 50.0); //第2个点
    /// Offset firstControlPoint = Offset(size.width / 2, size.height);
    /// Offset firstEdnPoint = Offset(size.width, size.height - 50.0);
    /// path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    ///     firstEdnPoint.dx, firstEdnPoint.dy);
    /// path.lineTo(size.width, size.height - 50.0); //第3个点
    /// path.lineTo(size.width, 0); //第4个点

    /// 波浪曲线路径
    /// 第1个点
    path.lineTo(0, 0);

    /// 第2个点
    path.lineTo(0, size.height - 40.0);

    /// 第一段曲线控制点
    Offset firstControlPoint = Offset(size.width / 4, size.height);

    /// 第一段曲线结束点
    Offset firstEndPoint = Offset(size.width / 2.25, size.height - 30);
    print(firstEndPoint);

    /// 形成曲线
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    /// 第二段曲线控制点
    Offset secondControlPoint = Offset(size.width / 4 * 3, size.height - 90);

    /// 第二段曲线结束点
    Offset secondEndPoint = Offset(size.width, size.height - 40);

    /// 形成曲线
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
