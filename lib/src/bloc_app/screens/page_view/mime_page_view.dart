import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MimePageView extends StatefulWidget {
  MimePageView({Key key}) : super(key: key);

  @override
  _MimePageViewState createState() => _MimePageViewState();
}

class _MimePageViewState extends State<MimePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
              height: 260,
              child: Stack(children: [
                Swiper(
                    // itemHeight: 80,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        "http://via.placeholder.com/350x180",
                        fit: BoxFit.fill,
                      );
                    }),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0))),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20)),
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
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.black54,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
    );
  }
}
