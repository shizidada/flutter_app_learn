import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/res/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app_learn/src/app/utils/screen_util.dart';

class MimeScreen extends StatefulWidget {
  MimeScreen({Key key}) : super(key: key);

  @override
  _MimeScreenState createState() => _MimeScreenState();
}

class _MimeScreenState extends State<MimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
              width: double.infinity,
              height: AppScreen.setHeight(650.0),
              child: Stack(children: [
                Container(
                  color: Colors.indigoAccent,
                  width: double.infinity,
                  height: AppScreen.setHeight(450.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: 80,
                            height: 80,
                            child: CircleAvatar(
                              minRadius: 80,
                              backgroundImage: AssetImage(
                                'assets/images/nz.jpg',
                              ),
                              // backgroundColor: Colors.white,
                              // foregroundColor: Colors.black,
                            )),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "昵称: 测试",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "手机号: 15899999999",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                              )
                            ]),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ]),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: AppScreen.setHeight(250.0),
                      margin: EdgeInsets.only(left: 4, right: 4, bottom: 16),
                      decoration: buildBoxDecoration(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      child: Text(
                                    "积分: 12323",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.darkerText),
                                  )),
                                  Container(
                                      child: Text(
                                    "发布: 12323",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.darkerText),
                                  )),
                                  Container(
                                      child: Text(
                                    "快递：2658",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.darkerText),
                                  ))
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      child: Text(
                                    "订阅：6666",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.darkerText),
                                  )),
                                  Container(
                                      child: Text(
                                    "关注：2658",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.darkerText),
                                  )),
                                  Container(
                                      child: Text(
                                    "收藏：2658",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.darkerText),
                                  ))
                                ]),
                          ]),
                    ))
              ])),
          _buildItem(),
          _buildItem(),
          _buildItem(),
        ]),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
        boxShadow: [BoxShadow(color: Colors.grey)]);
  }

  Widget _buildItem() {
    return Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.only(left: 4, right: 4, bottom: 16),
      decoration: buildBoxDecoration(),
    );
  }
}
