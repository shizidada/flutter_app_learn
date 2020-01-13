import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app_learn/src/config/index.dart';

class InputItem extends StatelessWidget {
  InputItem(
      {this.hintText = 'pealse setting input item hintText',
      @required this.icon,
      this.suffixIcon,
      @required this.controller,
      this.obscureText = false,
      this.keyboardType = TextInputType.number});

  final TextEditingController controller;
  final Icon icon;
  final Icon suffixIcon;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Container(
      padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(8.0)),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        cursorColor: MColors.alipayColor,
        decoration: InputDecoration(
          icon: icon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          contentPadding:
              EdgeInsets.all(ScreenUtil.getInstance().setWidth(16.0)),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(color: MColors.alipayColor, width: 0.5),
          ),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: MColors.de)),
        ),
      ),
    );
  }
}
