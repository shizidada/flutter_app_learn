import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHGlobalContainerWrapper extends StatelessWidget {
  final Widget child;

  final BoxDecoration decoration;

  ATHGlobalContainerWrapper({this.child, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: decoration,
      child: child,
    );
  }
}
