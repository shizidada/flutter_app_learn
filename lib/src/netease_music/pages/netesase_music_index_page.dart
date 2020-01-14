import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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

    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          leading: Container(
            padding: EdgeInsets.only(left: sc.setWidth(16.0)),
            child: SvgPicture.asset("assets/svg/netease_logo.svg",
                fit: BoxFit.contain, color: Colors.white),
          ),
          title: Text('网易云音乐'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: bannerSwiperView(context),
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
                    ListView.builder(
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
                        title: Text("Content of 推荐音乐 Item $index"),
                      ),
                    ),
                    ListView.builder(
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
                        title: Text("Content of 热歌榜 Item $index"),
                      ),
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
                        title: Text("Content of 搜索 Item $index"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bannerSwiperView(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    ScreenUtil sc = ScreenUtil.getInstance();
    return Container(
      width: ScreenUtil.screenWidth,
      height: sc.setHeight(280.0),
      child: Swiper(
        itemCount: 4,
        itemBuilder: (BuildContext context, int position) {
          return Container(
            height: sc.setHeight(280.0),
            color: Colors.redAccent,
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
