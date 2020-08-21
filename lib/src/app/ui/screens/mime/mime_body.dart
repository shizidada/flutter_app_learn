import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/colors.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/global_container_wrapper.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroll/scroller_configuration_wrapper.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';

import 'widgets/basic_info_item.dart';

class ATHMimeBody extends StatelessWidget {
  final List<String> listData = ["总资产", "我的收藏", "我的关注", "历史记录", "我的客服"];

  @override
  Widget build(BuildContext context) {
    return ATHScrollerConfigurationWrapper(
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
              width: double.infinity,
              height: 500.px,
              child: Stack(children: [
                buildUserInfoContainer(),
                buildBasicInfoContainer()
              ])),
          ATHGlobalContainerWrapper(
            child: ListView.builder(
                itemCount: listData.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  String title = listData[index];
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.px),
                    margin: EdgeInsets.only(bottom: 20.px),
                    decoration: buildBoxDecoration(),
                    child: ListTile(
                        leading: CircleAvatar(
                            backgroundColor: ATHColors.primaryColor,
                            child: Text(
                              title.substring(0, 1),
                              style: TextStyle(color: ATHColors.lightWhiteColor),
                            )),
                        title: Text(
                          title,
                          style: TextStyle(color: ATHColors.color33),
                        )),
                  );
                }),
          )
        ]),
      ),
    );
  }

  Container buildUserInfoContainer() {
    return Container(
      width: double.infinity,
      height: 400.px,
      decoration: BoxDecoration(
          gradient: buildMimeLinearGradient(),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.px),
              bottomRight: Radius.circular(25.px))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            width: 135.px,
            height: 135.px,
            margin: EdgeInsets.only(left: 24.px),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.px),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      color: Colors.white60,
                      blurRadius: 2.px)
                ]),
            child: CircleAvatar(
              minRadius: 80.px,
              backgroundImage: AssetImage(
                'assets/images/dhxy.jpg',
              ),
            )),
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24.px),
                  child: Text(
                    "Leo",
                    style: TextStyle(color: Colors.white, fontSize: 36.px),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24.px, top: 16.px),
                  padding: EdgeInsets.symmetric(horizontal: 8.px),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10.px))),
                  child: Text(
                    "shizidada@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 22.px),
                  ),
                )
              ]),
        ),
        Container(
          margin: EdgeInsets.only(right: 24.px),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 32.px,
            color: Colors.white,
          ),
        )
      ]),
    );
  }

  Positioned buildBasicInfoContainer() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          width: double.infinity,
          height: 180.px,
          margin: EdgeInsets.only(left: 20.px, right: 20.px),
          decoration: buildBoxDecoration(),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ATHBasicInfoItem("2658", "收藏"),
              ATHBasicInfoItem("6666", "评价"),
              ATHBasicInfoItem("12333", "卡券"),
              ATHBasicInfoItem("2659", "订单")
            ]),
          ]),
        ));
  }

  LinearGradient buildMimeLinearGradient() {
    return LinearGradient(colors: [
      ATHColors.primaryColor.withAlpha(220),
      ATHColors.primaryColor.withAlpha(230),
      ATHColors.primaryColor.withAlpha(240),
      ATHColors.primaryColor.withAlpha(250),
      ATHColors.primaryColor,
    ]);
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.px)),
        boxShadow: [BoxShadow(color: Colors.grey)]);
  }
}
