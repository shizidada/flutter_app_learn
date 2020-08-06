import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              height: ScreenUtil().setHeight(600.0),
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(450.0),
                  child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl:
                          'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg@1280w_1l_2o_100sh.jpg'),
                ),
                Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: ScreenUtil().setHeight(200.0),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          )),
                    ))
              ])),
          _buildItem(),
          _buildItem(),
          _buildItem(),
          _buildItem(),
          _buildItem(),
          _buildItem(),
        ]),
      ),
    );
  }

  Widget _buildItem() {
    return Card(
      child: Container(
        width: double.infinity,
        height: 120,
        color: Colors.grey,
      ),
    );
  }
}
