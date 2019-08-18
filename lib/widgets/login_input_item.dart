import 'package:flutter/material.dart';
import 'package:flutter_app_learn/config/colors.dart';

class LoginItem extends StatelessWidget {
  LoginItem(this._hintText, this._icon, this._controller);

  final TextEditingController _controller;
  final Icon _icon;
  final String _hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          icon: _icon,
          contentPadding: EdgeInsets.all(10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(
              color: KColors.de, //边线颜色为黄色
              width: 0.5, //边线宽度为2
            ),
          ),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: KColors.de)),
          hintText: _hintText,
        ),
      ),
    );
  }
}
