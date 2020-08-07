import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/res/values/colors.dart';
import 'package:flutter_app_learn/src/app/res/size/size.dart';

class MimeScreen extends StatefulWidget {
  MimeScreen({Key key}) : super(key: key);

  @override
  _MimeScreenState createState() => _MimeScreenState();
}

class _MimeScreenState extends State<MimeScreen> {
  final List<String> listData = ["总资产", "我的收藏", "我的关注", "历史记录", "我的客服"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(AppStrings.kMimeTitle),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
              width: double.infinity,
              height: AppHeightSize.height580,
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
                  margin: EdgeInsets.only(
                      left: AppWidthSize.width20,
                      right: AppWidthSize.width20,
                      bottom: AppWidthSize.width40),
                  padding: EdgeInsets.symmetric(vertical: AppWidthSize.width20),
                  decoration: buildBoxDecoration(),
                  child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.indigoAccent,
                          child: Text(
                            title.substring(0, 1),
                            style: TextStyle(color: Colors.white),
                          )),
                      title: Text(
                        title,
                        style: TextStyle(
                            color: AppColors.kTextColor,
                            fontSize: AppFontSize.fonstSize36),
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
      height: AppHeightSize.height420,
      decoration: BoxDecoration(gradient: buildMimeLinearGradient()),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(left: 24),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      color: Colors.white60,
                      blurRadius: 2)
                ]),
            child: CircleAvatar(
              minRadius: 80,
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
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Leo",
                    style: TextStyle(
                        color: Colors.white, fontSize: AppFontSize.fonstSize36),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    "shizidada@gmail.com",
                    style: TextStyle(
                        color: Colors.white, fontSize: AppFontSize.fonstSize28),
                  ),
                )
              ]),
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
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
          height: AppHeightSize.height220,
          margin: EdgeInsets.only(
            left: AppWidthSize.width20,
            right: AppWidthSize.width20,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: AppRadiusSize.circular15,
                topRight: AppRadiusSize.circular15,
                bottomLeft: AppRadiusSize.circular15,
                bottomRight: AppRadiusSize.circular15,
              ),
              boxShadow: [BoxShadow(color: Colors.grey)]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          child: Text(
                        "发布: 12323",
                        style: TextStyle(
                            fontSize: AppFontSize.fonstSize36,
                            color: AppColors.kTextColor),
                      )),
                      Container(
                          child: Text(
                        "积分：6666",
                        style: TextStyle(
                            fontSize: AppFontSize.fonstSize36,
                            color: AppColors.kTextColor),
                      )),
                      Container(
                          child: Text(
                        "阅读：2658",
                        style: TextStyle(
                            fontSize: AppFontSize.fonstSize36,
                            color: AppColors.kTextColor),
                      )),
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
          topLeft: AppRadiusSize.circular15,
          topRight: AppRadiusSize.circular15,
          bottomLeft: AppRadiusSize.circular15,
          bottomRight: AppRadiusSize.circular15,
        ),
        boxShadow: [BoxShadow(color: Colors.grey)]);
  }
}
