import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHLoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            "密码登录",
            style: TextStyle(fontSize: 38.sp),
          )
        ],
      ),
    );
  }
}
