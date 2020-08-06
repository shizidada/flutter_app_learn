import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatelessWidget {
  SearchInput(
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
    return Container(
      height: ScreenUtil().setHeight(58.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(ScreenUtil().setWidth(8.0)),
          )),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            icon: Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(8.0)),
              child: icon,
            ),
            hintText: hintText,
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.only(bottom: ScreenUtil().setWidth(24.0))),
      ),
    );
  }
}
