import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHRoundButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const ATHRoundButton({
    Key key,
    this.text,
    this.press,
    this.color = ATHColors.color22,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 24.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.w),
        child: FlatButton(
          onPressed: press,
          padding: EdgeInsets.symmetric(vertical: 24.w),
          color: color,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
