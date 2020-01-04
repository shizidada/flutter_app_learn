import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 简单列表项
class SampleListItem extends StatelessWidget {
  /// 方向
  final Axis direction;

  const SampleListItem({
    Key key,
    this.direction = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return direction == Axis.vertical
        ? Card(
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    height: ScreenUtil.getInstance().setHeight(100.0),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        color: Colors.grey[200],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.all(
                          10.0,
                        ),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: ScreenUtil.getInstance()
                                          .setWidth(120.0),
                                      height: ScreenUtil.getInstance()
                                          .setHeight(15.0),
                                      color: Colors.grey[200],
                                    ),
                                    Container(
                                      width: ScreenUtil.getInstance()
                                          .setWidth(60.0),
                                      height: ScreenUtil.getInstance()
                                          .setHeight(10.0),
                                      margin: EdgeInsets.only(
                                          top: ScreenUtil.getInstance()
                                              .setWidth(10.0)),
                                      color: Colors.grey[200],
                                    ),
                                  ],
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.grey[200],
                                )
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(8.0),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height:
                                      ScreenUtil.getInstance().setHeight(8.0),
                                  color: Colors.grey[200],
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(4.0),
                                ),
                                Container(
                                  height:
                                      ScreenUtil.getInstance().setHeight(8.0),
                                  color: Colors.grey[200],
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(4.0),
                                ),
                                Container(
                                  height:
                                      ScreenUtil.getInstance().setHeight(8.0),
                                  width:
                                      ScreenUtil.getInstance().setWidth(150.0),
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )
        : Card(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil.getInstance().setHeight(100.0),
                    width: ScreenUtil.screenWidth,
                    color: Colors.grey[200],
                  ),
                  Container(
                    width: ScreenUtil.screenWidth,
                    padding:
                        EdgeInsets.all(ScreenUtil.getInstance().setWidth(10.0)),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width:
                                      ScreenUtil.getInstance().setWidth(80.0),
                                  height:
                                      ScreenUtil.getInstance().setHeight(15.0),
                                  color: Colors.grey[200],
                                ),
                                Container(
                                  width:
                                      ScreenUtil.getInstance().setWidth(60.0),
                                  height:
                                      ScreenUtil.getInstance().setHeight(10.0),
                                  margin: EdgeInsets.only(
                                      top: ScreenUtil.getInstance()
                                          .setWidth(8.0)),
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey[200],
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(8.0),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: ScreenUtil.getInstance().setHeight(8.0),
                              color: Colors.grey[200],
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(4.0),
                            ),
                            Container(
                              height: ScreenUtil.getInstance().setHeight(8.0),
                              color: Colors.grey[200],
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(4.0),
                            ),
                            Container(
                              height: ScreenUtil.getInstance().setHeight(8.0),
                              width: ScreenUtil.getInstance().setWidth(100.0),
                              color: Colors.grey[200],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
