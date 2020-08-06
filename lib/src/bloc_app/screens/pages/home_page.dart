import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/mocks/home_mock_data.dart';
import 'package:flutter_app_learn/src/bloc_app/utils/navigate_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// with AutomaticKeepAliveClientMixin

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  ScrollController scrollController;

  SwiperController swiperController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();

    swiperController = SwiperController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [bannerSwiperView(), buildListView()])));
  }

  ListView buildListView() {
    List<HomeMockBean> homeLists = HomeMockUtils.homeLists;
    return ListView.builder(
        itemCount: homeLists.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                NavigatorUtil.pushFromRight(context, homeLists[index].path);
              },
              child: Column(children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigoAccent,
                    foregroundColor: Colors.white,
                    child: Text(homeLists[index].name.substring(0, 1)),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  title: Text(homeLists[index].name),
                ),
                Divider()
                // Drivier();
              ]),
            ));
  }

  Widget bannerSwiperView() {
    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(480.0),
      child: Swiper(
        itemCount: 2,
        itemBuilder: (BuildContext context, int position) {
          return CachedNetworkImage(
            imageUrl:
                'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg@1280w_1l_2o_100sh.jpg',
            fit: BoxFit.fill,
          );
        },
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54, activeColor: Colors.white)),
        controller: swiperController,
        scrollDirection: Axis.horizontal,
        // autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
