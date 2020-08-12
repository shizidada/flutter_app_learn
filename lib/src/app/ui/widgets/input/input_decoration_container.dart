import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHInputDecorationContainer extends StatelessWidget {
  final Widget child;

  ATHInputDecorationContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 36.h),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: ATHColors.color8c))),
        child: child);
  }
}
