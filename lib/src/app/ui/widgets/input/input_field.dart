import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';

import 'input_decoration_container.dart';

class ATHInputFiled extends StatelessWidget {
  final String labelTitle;

  final String hintText;

  ATHInputFiled({this.labelTitle = "Label", this.hintText = "HintText"});

  @override
  Widget build(BuildContext context) {
    return ATHInputDecorationContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 24.px),
            constraints: BoxConstraints(maxWidth: 240.px),
            child: Text(
              labelTitle,
              style: TextStyle(
                  color: ATHColors.color66,
                  fontSize: 30.px),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: ATHColors.color99, fontSize: 30.px),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
