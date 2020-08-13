import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/utils/navigator_util.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

import 'search_input.dart';

class ATHSearchTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            height: 58.h,
            decoration: BoxDecoration(
                color: ATHColors.lightWhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(10.w))),
            child: ATHSearchInput(),
          ),
        ),
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(left: 24.w),
              child: Text(
            "取消",
            style: TextStyle(color: Colors.white, fontSize: 32.sp),
          )),
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            ATHNavigator.pop(context);
          },
        ),
      ],
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: ATHColors.primaryColor, boxShadow: [BoxShadow(color: Colors.grey)]);
  }
}
