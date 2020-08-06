import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeteaseMusicTipItem extends StatelessWidget {
  NeteaseMusicTipItem({Key key, @required this.tipName}) : super(key: key);

  final String tipName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(56.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(8.0),
                top: ScreenUtil().setWidth(8.0)),
            width: ScreenUtil().setWidth(5.0),
            color: Colors.redAccent,
          ),
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(8.0),
                top: ScreenUtil().setWidth(8.0)),
            child: Text(
              tipName,
              style: TextStyle(fontSize: ScreenUtil().setSp(32.0)),
            ),
          ),
        ],
      ),
    );
  }
}
