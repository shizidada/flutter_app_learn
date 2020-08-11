import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHGlobalContainerWrapper extends StatelessWidget {
  final Widget child;

  ATHGlobalContainerWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: child,
    );
  }
}
