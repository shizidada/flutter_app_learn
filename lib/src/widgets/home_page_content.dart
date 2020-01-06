import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter_app_learn/src/utils/navigate_util.dart';

class HomePageContent extends StatefulWidget {
  HomePageContent({@required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent>
    with AutomaticKeepAliveClientMixin {
  List<Widget> _swiperImageList = [];

  @override
  void initState() {
    super.initState();
    _swiperImageList
      ..add(Image.asset(
        'assets/images/1.jpeg',
        fit: BoxFit.cover,
      ))
      ..add(Image.asset(
        'assets/images/2.jpeg',
        fit: BoxFit.cover,
      ))
      ..add(Image.asset(
        'assets/images/3.jpeg',
        fit: BoxFit.cover,
      ))
      ..add(Image.asset(
        'assets/images/4.jpeg',
        fit: BoxFit.cover,
      ));
    print("initState ... " + widget.title);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    String title = widget.title;

    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (contxt, index) {
                if (index == 0) {
                  return bannerSwiperView(
                      ScreenUtil.getInstance().setHeight(300.0));
                }
                return Container(
                  padding:
                      EdgeInsets.all(ScreenUtil.getInstance().setWidth(8.0)),
                  height: ScreenUtil.getInstance().setHeight(188.0),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.book),
                      trailing: Icon(Icons.message),
                      title: Text("$title $index"),
                      subtitle: Text("1234567890"),
                      onTap: () {
                        NavigatorUtil.pushFromRight(
                            context, "/detail/$index/$title/江景");
                      },
                      // isThreeLine: true,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget bannerSwiperView(height) {
    return Container(
      width: ScreenUtil.screenWidth,
      height: height,
      child: Swiper(
        itemCount: 4,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54, activeColor: Colors.white)),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        // autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return _swiperImageList[index];
  }

  @override
  bool get wantKeepAlive => true;
}
