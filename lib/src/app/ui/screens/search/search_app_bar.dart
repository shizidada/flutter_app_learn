import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/utils/navigator_util.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

import 'search_input.dart';

class ATHSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  ATHSearchAppBar({this.height: 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      decoration: buildBoxDecoration(),
      padding: EdgeInsets.all(24.w).copyWith(top: 40.w),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 66.h,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(60.w))),
              child: ATHSearchInput(),
            ),
          ),
          GestureDetector(
            child: Container(
                width: 100.w,
                alignment: Alignment.center,
                child: Text(
                  "取消",
                  style: TextStyle(color: Colors.white),
                )),
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              ATHNavigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: ATHColors.primaryColor,
        boxShadow: [BoxShadow(color: Colors.grey)]);
  }
}
