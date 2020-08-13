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
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        boxShadow: [BoxShadow(color: Colors.grey)]);
  }
}
