import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHSearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
          hintText: "了∑(っ°Д°;)っ卧槽，不见了∑(っ°Д°;)っ卧槽，不见了∑(っ°Д°;)っ卧槽，不见了",
          hintStyle: TextStyle(fontSize: 22.sp, color: ATHColors.normalColor),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          prefixStyle: TextStyle()),
    );
  }
}
