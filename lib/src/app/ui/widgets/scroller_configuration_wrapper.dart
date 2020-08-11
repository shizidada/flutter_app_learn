import 'package:flutter/material.dart';

import 'over_scroll_behavior.dart';

class ATHScrollerConfigurationWrapper extends StatelessWidget {
  final Widget child;

  ATHScrollerConfigurationWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: OverScrollBehavior(),
      child: child,
    );
  }
}
