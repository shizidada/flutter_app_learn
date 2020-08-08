import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHSearchContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildSearchContent();
  }

  Widget buildSearchContent() {
    return Container(
      height: 78.h,
      decoration: buildBoxDecoration(),
      child: Row(
        children: <Widget>[Text('搜索页')],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.w),
          topRight: Radius.circular(8.w),
          bottomLeft: Radius.circular(8.w),
          bottomRight: Radius.circular(8.w),
        ),
        boxShadow: [BoxShadow(color: Colors.grey)]);
  }
}
