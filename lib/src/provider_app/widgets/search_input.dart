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
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    ScreenUtil sc = ScreenUtil.getInstance();

    return Container(
      height: sc.setHeight(58.0),
      // margin: EdgeInsets.all(sc.setHeight(8.0)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(sc.setWidth(8.0)),
          )),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            icon: Container(
              margin: EdgeInsets.only(left: sc.setWidth(8.0)),
              child: icon,
            ),
            hintText: hintText,
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: sc.setWidth(24.0))),
      ),
    );
  }
}
