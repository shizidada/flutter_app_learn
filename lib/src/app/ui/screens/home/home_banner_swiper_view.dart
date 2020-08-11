import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';

class ATHHomeBannerSwiperView extends StatelessWidget {
  final SwiperController swiperController;

  ATHHomeBannerSwiperView({this.swiperController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400.h,
      child: Swiper(
        itemCount: 2,
        itemBuilder: (BuildContext context, int position) {
          return Image.asset('assets/images/nz.jpg', fit: BoxFit.fill);
        },
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54, activeColor: Colors.white)),
        controller: swiperController,
        scrollDirection: Axis.horizontal,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }
}
