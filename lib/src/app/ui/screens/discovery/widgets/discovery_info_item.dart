import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/colors.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ATHDiscoveryInfoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.w)),
            child: Container(
              height: 400.h,
              color: ATHColors.colorf1,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 250.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/icons/icon_trophy.svg',
                              width: 88.w,
                              height: 88.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.h, top: 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/icons/icon_hot.svg',
                                    width: 50.w,
                                    height: 50.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: Text(
                                      "278℃",
                                      style: TextStyle(
                                          fontSize: 38.sp,
                                          color: Colors.orangeAccent),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "2018-08-08",
                              style: TextStyle(color: ATHColors.color66),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.w)),
                                child: Container(
                                  width: 80.w,
                                  height: 80.w,
                                  child: Image.asset('assets/images/nz.jpg',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Text(
                                '来了撒',
                                style: TextStyle(
                                    color: ATHColors.color33, fontSize: 30.sp),
                              ),
                            ],
                          ),
                        )
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
                                topLeft: Radius.circular(20.w),
                                bottomLeft: Radius.circular(20.w)),
                            child: Container(
                                child: Image.asset('assets/images/nz.jpg',
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Positioned(
                            right: 10.w,
                            top: 10.h,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.w)),
                              child: Container(
                                width: 100.w,
                                height: 40.h,
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              '你真TN十个人才',
              style: TextStyle(fontSize: 38.sp, color: ATHColors.color33),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 6.w),
                color: ATHColors.primaryLightColor,
                child: Text(
                  '插画设计',
                  style: TextStyle(fontSize: 24.sp, color: ATHColors.color99),
                ),
              ),
              Row(
                children: <Widget>[
                  Text('12412浏览',
                      style:
                          TextStyle(fontSize: 28.sp, color: ATHColors.color33)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text('124评论',
                        style: TextStyle(
                            fontSize: 28.sp, color: ATHColors.color33)),
                  ),
                  Text('666点赞',
                      style:
                          TextStyle(fontSize: 28.sp, color: ATHColors.color33)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
