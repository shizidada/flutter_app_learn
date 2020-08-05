import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/res/colors.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MimePage extends StatefulWidget {
  MimePage({Key key}) : super(key: key);

  @override
  _MimePageState createState() => _MimePageState();
}

class _MimePageState extends State<MimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
              height: 400,
              child: Stack(children: [
                Container(
                  height: 300,
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
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          color: MColors.kBoxShowColor,
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
        margin: EdgeInsets.symmetric(horizontal: 2),
        width: double.infinity,
        height: 120,
        color: MColors.k99Color,
      ),
    );
  }
}
