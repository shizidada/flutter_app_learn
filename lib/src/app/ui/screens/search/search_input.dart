import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ATHSearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 56.px,
        decoration: BoxDecoration(
            color: ATHColors.lightWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(10.px))),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.px),
              child: SvgPicture.asset(
                'assets/icons/icon_search.svg',
                color: ATHColors.color99,
                width: 48.px,
                height: 48.px,
              ),
            ),
            Expanded(
              child: TextField(
                cursorColor: ATHColors.lightBlueColor,
                decoration: InputDecoration(
                  hintText: "了∑(っ°Д°;)っ卧槽，不见了∑(っ°Д°;)っ卧槽，不见了∑(っ°Д°;)っ卧槽，不见了",
                  hintStyle:
                      TextStyle(fontSize: 22.px, color: ATHColors.color99),
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
