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
            padding: EdgeInsets.only(right: 36.w),
            constraints: BoxConstraints(maxWidth: 240.w),
            child: Text(
              labelTitle,
              style: TextStyle(
                  color: ATHColors.primaryColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    TextStyle(color: ATHColors.normalColor, fontSize: 30.sp),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
