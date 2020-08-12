import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/global_container_wrapper.dart';
import 'file:///E:/Code/flutter/flutter_app_learn/lib/src/app/ui/widgets/scroll/scroller_configuration_wrapper.dart';

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
              height: 500.h,
              child: Stack(children: [
                buildUserInfoContainer(),
                buildBasicInfoContainer()
              ])),
          ATHGlobalContainerWrapper(
            child: ListView.builder(
                itemCount: listData.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  String title = listData[index];
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    margin: EdgeInsets.only(bottom: 20.h),
                    decoration: buildBoxDecoration(),
                    child: ListTile(
                        leading: CircleAvatar(
                            backgroundColor: ATHColors.color22,
                            child: Text(
                              title.substring(0, 1),
                              style: TextStyle(color: Colors.white),
                            )),
                        title: Text(
                          title,
                          style: TextStyle(color: ATHColors.color22),
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
      height: 400.h,
      decoration: BoxDecoration(
          gradient: buildMimeLinearGradient(),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.w),
              bottomRight: Radius.circular(20.w))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            width: 200.w,
            height: 200.w,
            margin: EdgeInsets.only(left: 24.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.w),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      color: Colors.white60,
                      blurRadius: 2.w)
                ]),
            child: CircleAvatar(
              minRadius: 80.w,
              backgroundImage: AssetImage(
                'assets/images/nz.jpg',
              ),
            )),
        Expanded(
          flex: 1,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24.w),
                  child: Text(
                    "Leo",
                    style: TextStyle(color: Colors.white, fontSize: 36.sp),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24.w, top: 16.h),
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(15.w))),
                  child: Text(
                    "shizidada@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 22.sp),
                  ),
                )
              ]),
        ),
        Container(
          margin: EdgeInsets.only(right: 24.w),
          child: Icon(
            Icons.arrow_forward_ios,
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
          height: 180.h,
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
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
//      ATHColors.color22.withAlpha(180),
//      ATHColors.color22.withAlpha(190),
//      ATHColors.color22.withAlpha(200),
      ATHColors.color22,
      ATHColors.color22,
    ]);
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.w),
          topRight: Radius.circular(8.w),
          bottomLeft: Radius.circular(8.w),
          bottomRight: Radius.circular(8.w),
        ),
        boxShadow: [BoxShadow(color: Colors.grey)]);
  }
}
