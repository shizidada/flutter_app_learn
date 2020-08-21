import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/colors.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';

class ATHMessageItem extends StatelessWidget {
  final Function onMessageItemClick;

  ATHMessageItem({this.onMessageItemClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.px),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                      backgroundColor: ATHColors.lightBlueColor,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "评论 评论 评论 评论评论 评论 评论",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: ATHColors.color33),
                            ),
                          ),
                          Text(
                            "评论 评论 评论 评论评论 评论 评论 评论 评论评论评论 评论 评论 评论评论评论 评论 评论 评论评论",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: ATHColors.color99),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 30.px,
              height: 30.px,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(15.px))),
              child: Text('66',
                  style: TextStyle(
                      fontSize: 20.px, color: ATHColors.lightWhiteColor),
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
      onTap: onMessageItemClick,
    );
  }
}
