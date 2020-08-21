import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';

class ATHGlobalContainerWrapper extends StatelessWidget {
  final Widget child;

  final BoxDecoration decoration;

  ATHGlobalContainerWrapper({this.child, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.px, vertical: 20.px),
      decoration: decoration,
      child: child,
    );
  }
}
