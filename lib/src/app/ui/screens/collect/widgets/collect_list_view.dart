import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/colors.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/item_divider.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroll/scroller_configuration_wrapper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ATHCollectListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ATHScrollerConfigurationWrapper(
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ATHCollectItem();
        },
      ),
    );
  }
}

class ATHCollectItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ATHCollectUserInfo(),
        ATHCollectContentItem(),
        ATHCollectGridImageItem(),
        ATHCollectCommentItem(),
        ATHCollectOperation(),
        ATHItemDivider(),
      ],
    );
  }
}

class ATHCollectOperation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10.px),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.px)),
                  shape: BoxShape.rectangle,
                  color: ATHColors.colorf1),
              child: Text(
                '这个是话题',
                style: TextStyle(fontSize: 22.px, color: ATHColors.color99),
              )),
          Row(
            children: <Widget>[
              Text(
                '分享 12',
                style: TextStyle(fontSize: 22.px, color: ATHColors.color99),
              ),
              Text(
                '评论 125',
                style: TextStyle(fontSize: 22.px, color: ATHColors.color99),
              ),
              Text(
                '点赞 365',
                style: TextStyle(fontSize: 22.px, color: ATHColors.color99),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ATHCollectCommentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.px),
      padding: EdgeInsets.all(16.px),
      decoration: BoxDecoration(
          color: ATHColors.colorf1,
          borderRadius: BorderRadius.all(Radius.circular(16.px))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset('assets/icons/icon_hot.svg', width: 30.px),
                  Text(
                    "热评",
                    style: TextStyle(color: ATHColors.color33, fontSize: 22.sp),
                  )
                ],
              ),
              Text(
                "831赞",
                style: TextStyle(color: ATHColors.color33),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.px),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "江景i : ",
                  style: TextStyle(color: ATHColors.primaryColor),
                ),
                Text(
                  "哈哈哈, 你是沙雕吗？",
                  style: TextStyle(color: ATHColors.color33),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ATHCollectGridImageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.px),
      child: GridView.custom(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20.px,
          crossAxisSpacing: 20.px,
        ),
        childrenDelegate: SliverChildBuilderDelegate((context, position) {
          return Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.px)),
              child: Image.asset(
                'assets/images/nz.jpg',
                fit: BoxFit.cover,
              ),
            ),
          );
        }, childCount: 4),
      ),
    );
  }
}

class ATHCollectContentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.px),
          child: Text(
            "自学的最终目的是解决问题",
            style: TextStyle(color: ATHColors.color33, fontSize: 28.px),
          ),
        ),
        Text("很多同学是为了更高的薪资，更多的不可替代性，通过增加自己的能力和技术的边界及深度，来获得竞争力及安全感。",
            style: TextStyle(color: ATHColors.color66, fontSize: 26.px))
      ],
    );
  }
}

class ATHCollectUserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: CircleAvatar(
            backgroundColor: ATHColors.lightBlueColor,
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 24.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "狂蜂浪蝶卡萨",
                      style: TextStyle(color: ATHColors.color33),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.px),
                      child: Text(
                        "男",
                        style: TextStyle(color: ATHColors.color33),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.px),
                      child: Text(
                        "L8",
                        style: TextStyle(color: ATHColors.color33),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "2222-02-22 22:22:22",
                      style: TextStyle(color: ATHColors.color33),
                    ),
                    Text(
                      "2222 阅读",
                      style: TextStyle(color: ATHColors.color33),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
