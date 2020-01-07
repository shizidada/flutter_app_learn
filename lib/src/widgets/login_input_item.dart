import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app_learn/src/config/index.dart';

class LoginInputItem extends StatelessWidget {
  LoginInputItem(this._hintText, this._icon, this._controller, this._obscureText, this._keyboardType);

  final TextEditingController _controller;
  final Icon _icon;
  final String _hintText;
  final bool _obscureText;
  final TextInputType _keyboardType;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    
    return Container(
      padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(8.0)),
      child: TextField(
        controller: _controller,
        keyboardType: _keyboardType,
        obscureText: _obscureText,
        cursorColor: MColors.primaryColor,
        decoration: InputDecoration(
          icon: _icon,
          hintText: _hintText,
          contentPadding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(16.0)),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(
              color: Colors.grey, //边线颜色为黄色
              width: 0.5, //边线宽度为2
            ),
          ),
          // enabledBorder:
          //     UnderlineInputBorder(borderSide: BorderSide(color: MColors.de)),
        ),
      ),
    );
  }
}
