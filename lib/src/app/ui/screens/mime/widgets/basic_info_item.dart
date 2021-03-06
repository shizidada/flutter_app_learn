import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';

class ATHBasicInfoItem extends StatelessWidget {
  final String count;

  final String desc;

  ATHBasicInfoItem(this.count, this.desc);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: Text(
          count,
          style: TextStyle(fontSize: 32.px, color: ATHColors.color33),
        )),
        Container(
            child: Text(
          desc,
          style: TextStyle(fontSize: 28.px, color: ATHColors.color99),
        ))
      ],
    );
  }
}
