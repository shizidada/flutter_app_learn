import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';
import 'package:flutter_app_learn/src/app/core/utils/navigator_util.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/colors.dart';
import 'package:flutter_app_learn/src/app/ui/screens/discovery_detail/discovery_detail_screen.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/item_divider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ATHDiscoveryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ATHDiscoveryUserInfoItem(),
        ATHDiscoveryCardItem(),
        ATHDiscoveryOperatorItem(),
        ATHItemDivider()
      ],
    );
  }
}

class ATHDiscoveryOperatorItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(2.px),
            color: ATHColors.primaryLightColor,
            child: Text(
              '插画设计',
              style: TextStyle(fontSize: 26.px, color: ATHColors.color99),
            ),
          ),
          Row(
            children: <Widget>[
              Text('12412浏览',
                  style: TextStyle(fontSize: 26.px, color: ATHColors.color33)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.px),
                child: Text('124评论',
                    style:
                        TextStyle(fontSize: 26.px, color: ATHColors.color33)),
              ),
              Text('666点赞',
                  style: TextStyle(fontSize: 26.px, color: ATHColors.color33)),
            ],
          )
        ],
      ),
    );
  }
}

class ATHDiscoveryCardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ATHNavigator.pushFromRight(context, ATHDiscoveryDetailScreen.routeName);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.px)),
        child: Container(
          height: 300.px,
          color: ATHColors.colorf1,
          child: Row(
            children: <Widget>[
              Container(
                width: 250.px,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/icons/icon_trophy.svg',
                          width: 60.px,
                          height: 60.px,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.px, top: 12.px),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/icon_hot.svg',
                                width: 30.px,
                                height: 30.px,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.px),
                                child: Text(
                                  "278℃",
                                  style: TextStyle(
                                      fontSize: 26.px,
                                      color: Colors.orangeAccent),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "2018-08-08",
                      style: TextStyle(
                        color: ATHColors.color66,
                        fontSize: 22.px,
                      ),
                    ),
                    Text(
                      '来了撒',
                      style:
                          TextStyle(color: ATHColors.color33, fontSize: 22.px),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.px),
                            bottomLeft: Radius.circular(20.px)),
                        child: Container(
                            child: Image.asset('assets/images/dhxy.jpg',
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Positioned(
                        right: 16.px,
                        top: 16.px,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.px)),
                          child: Container(
                            width: 100.px,
                            height: 40.px,
                            color: Colors.redAccent,
                            alignment: Alignment.center,
                            child: Text(
                              'TOP1',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ATHDiscoveryUserInfoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ATHNavigator.pushFromRight(context, 'app://userInfoDetail');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.px),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30.px)),
                      child: Container(
                        width: 60.px,
                        height: 60.px,
                        child: Image.asset('assets/images/dhxy.jpg',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.px),
                child: Text(
                  '你真TN十个人才',
                  style: TextStyle(fontSize: 36.px, color: ATHColors.color33),
                ),
              ),
            ],
          ),
          Container(
            height: 60.px,
            child: RaisedButton(
              child: Text("关注"),
              color: ATHColors.primaryColor,
              textColor: Colors.white,
              elevation: 0,
              highlightElevation: 0,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
