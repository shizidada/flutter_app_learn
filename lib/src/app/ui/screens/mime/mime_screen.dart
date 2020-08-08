import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

import 'basic_info_item.dart';

class ATHMimeScreen extends StatefulWidget {
  ATHMimeScreen({Key key}) : super(key: key);

  @override
  _ATHMimeScreenState createState() => _ATHMimeScreenState();
}

class _ATHMimeScreenState extends State<ATHMimeScreen> {
  final List<String> listData = ["总资产", "我的收藏", "我的关注", "历史记录", "我的客服"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
              width: double.infinity,
              height: 500.h,
              child: Stack(children: [
                buildUserInfoContainer(),
                buildBasicInfoContainer()
              ])),
          ListView.builder(
              itemCount: listData.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                String title = listData[index];
                return Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.w),
                  padding: EdgeInsets.symmetric(vertical: 16.w),
                  decoration: buildBoxDecoration(),
                  child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: ATHColors.primaryColor,
                          child: Text(
                            title.substring(0, 1),
                            style:
                                TextStyle(color: Colors.white, fontSize: 26.sp),
                          )),
                      title: Text(
                        title,
                        style: TextStyle(
                            color: ATHColors.textColor, fontSize: 26.sp),
                      )),
                );
              })
        ]),
      ),
    );
  }

  Container buildUserInfoContainer() {
    return Container(
      width: double.infinity,
      height: 400.h,
      decoration: BoxDecoration(gradient: buildMimeLinearGradient()),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            width: 200.w,
            height: 200.w,
            margin: EdgeInsets.only(left: 24.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3.w),
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
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20.w))),
                  child: Text(
                    "shizidada@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 28.sp),
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
          height: 160.h,
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          decoration: buildBoxDecoration(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ATHBasicInfoItem("2658", "收藏"),
                      ATHBasicInfoItem("6666", "评价"),
                      ATHBasicInfoItem("12333", "卡券"),
                      ATHBasicInfoItem("2658", "消息"),
                    ]),
              ]),
        ));
  }

  LinearGradient buildMimeLinearGradient() {
    return LinearGradient(colors: [
      Colors.indigoAccent,
      Colors.indigoAccent[100],
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
