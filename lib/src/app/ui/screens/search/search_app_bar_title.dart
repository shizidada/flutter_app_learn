import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';
import 'package:flutter_app_learn/src/app/core/utils/navigator_util.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

import 'search_input.dart';

class ATHSearchAppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ATHSearchInput(),
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(left: 24.px),
              child: Text(
            "取消",
            style: TextStyle(color: Colors.white, fontSize: 32.px),
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
