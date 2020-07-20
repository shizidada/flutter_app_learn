import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeteaseMusicTipItem extends StatelessWidget {
  NeteaseMusicTipItem({Key key, @required this.tipName}) : super(key: key);

  final String tipName;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    ScreenUtil sc = ScreenUtil.getInstance();

    return Container(
      height: sc.setHeight(56.0),
      child: Row(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(left: sc.setWidth(8.0), top: sc.setWidth(8.0)),
            width: sc.setWidth(5.0),
            color: Colors.redAccent,
          ),
          Container(
            margin:
                EdgeInsets.only(left: sc.setWidth(8.0), top: sc.setWidth(8.0)),
            child: Text(
              tipName,
              style: TextStyle(fontSize: sc.setSp(32.0)),
            ),
          ),
        ],
      ),
    );
  }
}
