import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/config/colors.dart';

import 'package:flutter/cupertino.dart';

class AlipayIndexData {
  AlipayIndexData({this.name, this.icon});
  String name;
  Icon icon;
}

class HomePageMockData {
  static List<AlipayIndexData> alipayIndexData = [
    AlipayIndexData(
        name: "转账",
        icon: Icon(
          IconData(0xe601, fontFamily: "indexIcon"),
          color: MColors.alipayColor,
          size: 36,
        )),
    AlipayIndexData(
        name: "充值中心",
        icon: Icon(
          IconData(0xe626, fontFamily: "indexIcon"),
          color: Color(0xffE69D43),
          size: 36,
        )),
    AlipayIndexData(
        name: "蚂蚁森林",
        icon: Icon(
          IconData(0xe62f, fontFamily: "indexIcon"),
          color: Color(0xff55A892),
          size: 36,
        )),
    AlipayIndexData(
        name: "芝麻信用",
        icon: Icon(
          IconData(0xe649, fontFamily: "indexIcon"),
          color: Color(0xff55A892),
          size: 36,
        )),
    AlipayIndexData(
        name: "花呗",
        icon: Icon(
          IconData(0xe513, fontFamily: "indexIcon"),
          color: MColors.alipayColor,
          size: 36,
        )),
    AlipayIndexData(
        name: "余额宝",
        icon: Icon(
          IconData(0xe60b, fontFamily: "indexIcon"),
          color: Color(0xffDF6452),
          size: 36,
        )),
    AlipayIndexData(
        name: "火车票机票",
        icon: Icon(
          IconData(0xe67e, fontFamily: "indexIcon"),
          color: MColors.alipayColor,
          size: 36,
        )),
    AlipayIndexData(
        name: "我的快递",
        icon: Icon(
          IconData(0xe665, fontFamily: "indexIcon"),
          color: Color(0xffE69D43),
          size: 36,
        )),
    AlipayIndexData(
        name: "借呗",
        icon: Icon(
          IconData(0xe513, fontFamily: "indexIcon"),
          color: MColors.alipayColor,
          size: 36,
        )),
    AlipayIndexData(
        name: "红包",
        icon: Icon(
          IconData(0xe660, fontFamily: "indexIcon"),
          color: Color(0xffDF6452),
          size: 36,
        )),
    AlipayIndexData(
        name: "城市服务",
        icon: Icon(
          IconData(0xe501, fontFamily: "indexIcon"),
          color: MColors.alipayColor,
          size: 36,
        )),
    AlipayIndexData(
        name: "更多",
        icon: Icon(
          IconData(0xe636, fontFamily: "indexIcon"),
          color: Colors.grey,
          size: 36,
        )),
  ];
}
