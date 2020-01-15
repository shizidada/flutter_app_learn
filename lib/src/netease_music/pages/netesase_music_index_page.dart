import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app_learn/src/netease_music/pages/netease_music_hot_song_page.dart';
import 'package:flutter_app_learn/src/netease_music/pages/netease_music_recommend_page.dart';
import 'package:flutter_app_learn/src/netease_music/providers/netease_music_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_learn/src/netease_music/models/banner_model.dart';
import 'package:flutter_app_learn/src/netease_music/pages/netease_music_search_page.dart';

class NeteaseMusicIndexPage extends StatefulWidget {
  NeteaseMusicIndexPage({Key key}) : super(key: key);

  @override
  _NeteaseMusicIndexPageState createState() => _NeteaseMusicIndexPageState();
}

class _NeteaseMusicIndexPageState extends State<NeteaseMusicIndexPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController tabController;

  ScrollController scrollController;

  SwiperController swiperController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);

    scrollController = ScrollController();

    swiperController = SwiperController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    ScreenUtil sc = ScreenUtil.getInstance();

    NeteaseMusicProvider bannerProvider =
        Provider.of<NeteaseMusicProvider>(context);
    bannerProvider.getBanner({'type': 2});

    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          leading: Container(
            padding: EdgeInsets.only(left: sc.setWidth(16.0)),
            child: SvgPicture.asset("assets/svg/netease_logo.svg",
                fit: BoxFit.contain),
          ),
          title: Text('网易云音乐'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: CustomScrollView(
            controller: scrollController,
            physics: NeverScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: bannerProvider.bannerModel != null
                    ? bannerSwiperView(context, bannerProvider)
                    : Container(),
              ),
              SliverPersistentHeader(
                delegate: StickyTabBarDelegate(
                  child: TabBar(
                    labelColor: Colors.redAccent,
                    labelStyle: TextStyle(fontSize: sc.setSp(32.0)),
                    controller: this.tabController,
                    unselectedLabelColor: Colors.black,
                    unselectedLabelStyle: TextStyle(fontSize: sc.setSp(28.0)),
                    indicatorColor: Colors.redAccent,
                    tabs: <Widget>[
                      Tab(text: '推荐音乐'),
                      Tab(text: '热歌榜'),
                      Tab(text: '搜索'),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  controller: this.tabController,
                  children: <Widget>[
                    NeteaseMusicRecommendPage(),
                    NeteaseMusicHotSongPage(),
                    NeteaseMusicSearchPage()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bannerSwiperView(
      BuildContext context, NeteaseMusicProvider bannerProvider) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    ScreenUtil sc = ScreenUtil.getInstance();

    BannerModel bannerModel = bannerProvider.bannerModel;
    return Container(
      width: ScreenUtil.screenWidth,
      height: sc.setHeight(280.0),
      child: Swiper(
        itemCount: bannerModel != null ? bannerModel.banners.length : 0,
        itemBuilder: (BuildContext context, int position) {
          List<Banners> banners = bannerModel?.banners;
          return bannerModel != null && banners.length > 0
              ? Container(
                  height: sc.setHeight(280.0),
                  color: Colors.redAccent,
                  child: CachedNetworkImage(
                    imageUrl: banners[position].pic,
                    fit: BoxFit.fill,
                  ),
                )
              : Container();
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

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
