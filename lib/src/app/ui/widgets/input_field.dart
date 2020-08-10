import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

import 'input_decoration_container.dart';

class ATHInputFiled extends StatelessWidget {
  final String labelTitle;

  final String hintText;

  ATHInputFiled({this.labelTitle = "LabelTitle", this.hintText = "HintText"});

  @override
  Widget build(BuildContext context) {
    return ATHInputDecorationContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            constraints: BoxConstraints(maxWidth: 240.w),
            child: Text(
              labelTitle,
              style: TextStyle(color: ATHColors.color2b, fontSize: 30.sp),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: ATHColors.colorbe, fontSize: 30.sp),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
