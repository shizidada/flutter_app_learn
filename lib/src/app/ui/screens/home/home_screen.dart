import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/utils/navigator_util.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/screens/message/message_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/search/search_screen.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/global_container_wrapper.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroller_configuration_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// with AutomaticKeepAliveClientMixin

// 首页
class ATHHomeScreen extends StatefulWidget {
  ATHHomeScreen({Key key}) : super(key: key);

  @override
  _ATHHomeScreenState createState() => _ATHHomeScreenState();
}

class _ATHHomeScreenState extends State<ATHHomeScreen>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  ScrollController scrollController;

  SwiperController swiperController;

  TabController tabController;

  List<Widget> tabs = <Tab>[];

  @override
  void initState() {
    scrollController = ScrollController();

    swiperController = SwiperController();

    tabs = <Tab>[
      Tab(
        text: "关注",
      ),
      Tab(
        text: "推荐",
      ),
      Tab(
        text: "附近",
      ),
    ];

    //initialIndex初始选中第几个
    tabController =
        TabController(initialIndex: 1, length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ATHScrollerConfigurationWrapper(
        child: NestedScrollView(
          headerSliverBuilder: _silverBuilder,
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              ATHGlobalContainerWrapper(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: ATHColors.primaryColor,
                            child: Text('关注'),
                            foregroundColor: Colors.white,
                          ),
                          title: Text('title'),
                          subtitle: Text('subtitle'),
                        )),
              ),
              ATHGlobalContainerWrapper(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: ATHColors.primaryColor,
                      child: Text('推荐'),
                      foregroundColor: Colors.white,
                    ),
                    title: Text('title'),
                    subtitle: Text('subtitle'),
                  ),
                ),
              ),
              ATHGlobalContainerWrapper(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: ATHColors.primaryColor,
                      child: Text('附近'),
                      foregroundColor: Colors.white,
                    ),
                    title: Text('title'),
                    subtitle: Text('subtitle'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _silverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      buildSliverAppBar(),
    ];
  }

  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(slivers: <Widget>[
      buildSliverAppBar(),

      SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: SliverGrid(
          //Grid
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //Grid按两列显示
            crossAxisCount: 2,
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 10.w,
            childAspectRatio: 4.w,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              //创建子widget
              return Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        ),
      ),
      //List
      SliverFixedExtentList(
        itemExtent: 100.h,
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          //创建列表项
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text('list item $index'),
          );
        }, childCount: 50 //50个列表项
            ),
      ),
    ]);
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      leading: GestureDetector(
        child: IconButton(
          icon: SvgPicture.asset('assets/icons/icon_search.svg',
              width: 44.w, height: 44.w, color: Colors.white),
        ),
        onTap: () {
          ATHNavigator.pushFromRight(context, ATHSearchScreen.routeName);
        },
      ),
      actions: <Widget>[
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 18.w),
            child: SvgPicture.asset('assets/icons/icon_notice.svg',
                width: 44.w, height: 44.w, color: Colors.white),
          ),
          onTap: () {
            ATHNavigator.pushFromRight(context, ATHMessageScreen.routeName);
          },
        )
      ],
      elevation: 0,
      title: buildAppBarTitle(),
      pinned: true,
      floating: true,
      snap: true,
      expandedHeight: 300.0.h,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.fromLTRB(20, 40, 110, 10),
        background: buildBannerSwiperView(),
      ),
    );
  }

  Container buildAppBarTitle() {
    return Container(
        child: TabBar(
            tabs: tabs,
            indicator: BoxDecoration(),
            controller: tabController,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 36.sp),
            unselectedLabelColor: Colors.white,
            unselectedLabelStyle: TextStyle(fontSize: 32.sp)));
  }

  Widget buildBannerSwiperView() {
    return Container(
      width: ScreenUtil.screenWidth,
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

  @override
  bool get wantKeepAlive => true;
}

// _silverBuilder
// SliverPersistentHeader(
//   delegate: _SilverAppBarDelegate(TabBar(
//     controller: tabController,
//     tabs: tabs,
//   )),
// ),
// class _SilverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SilverAppBarDelegate(this._tabBar);

//   final TabBar _tabBar;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;

//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return _tabBar;
//   }

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
