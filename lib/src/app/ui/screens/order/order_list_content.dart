import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ATHOrderListContent extends StatefulWidget {
  @override
  _ATHOrderListContentState createState() => _ATHOrderListContentState();
}

class _ATHOrderListContentState extends State<ATHOrderListContent> {
  SwiperController _swiperController;

  @override
  void initState() {
    super.initState();

    _swiperController = SwiperController();

    _swiperController
      ..addListener(() {
        print('aaa');
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[buildBannerSwiperView()],
      ),
    );
  }

  Widget buildBannerSwiperView() {
    return Container(
      width: double.infinity,
      height: 240.px,
      child: Swiper(
        itemCount: 2,
        itemBuilder: (BuildContext context, int position) {
          return Image.asset('assets/images/dhxy.jpg', fit: BoxFit.fill);
        },
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54, activeColor: Colors.white)),
        controller: _swiperController,
        scrollDirection: Axis.horizontal,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }
}
