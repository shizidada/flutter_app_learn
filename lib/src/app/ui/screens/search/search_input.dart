import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ATHSearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
            color: ATHColors.lightWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(10.w))),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: SvgPicture.asset(
                'assets/icons/icon_search.svg',
                color: ATHColors.color99,
                width: 48.w,
                height: 48.w,
              ),
            ),
            Expanded(
              child: TextField(
                cursorColor: ATHColors.lightBlueColor,
                decoration: InputDecoration(
                  hintText: "了∑(っ°Д°;)っ卧槽，不见了∑(っ°Д°;)っ卧槽，不见了∑(っ°Д°;)っ卧槽，不见了",
                  hintStyle:
                      TextStyle(fontSize: 22.sp, color: ATHColors.color99),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
