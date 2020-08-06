import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// with AutomaticKeepAliveClientMixin

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
      body: NestedScrollView(
        headerSliverBuilder: _silverBuilder,
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigoAccent,
                        child: Text('关注'),
                        foregroundColor: Colors.white,
                      ),
                      title: Text('title'),
                      subtitle: Text('subtitle'),
                    )),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: Text('推荐'),
                  foregroundColor: Colors.white,
                ),
                title: Text('title'),
                subtitle: Text('subtitle'),
              ),
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: Text('附近'),
                  foregroundColor: Colors.white,
                ),
                title: Text('title'),
                subtitle: Text('subtitle'),
              ),
            ),
          ],
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
            crossAxisCount: 2, //Grid按两列显示
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
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
        itemExtent: 50.0,
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
      leading: Icon(Icons.search),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.call_to_action),
        )
      ],
      elevation: 0,
      title: buildAppBarTitle(),
      pinned: true,
      floating: true,
      snap: true,
      expandedHeight: 250.0,
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
            labelStyle: TextStyle(fontSize: 18.0),
            unselectedLabelColor: Colors.grey[100],
            unselectedLabelStyle: TextStyle(fontSize: 15.0)));
  }

  Widget buildBannerSwiperView() {
    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(400.0),
      child: Swiper(
        itemCount: 2,
        itemBuilder: (BuildContext context, int position) {
          return Image.asset(
            'assets/images/nz.jpg',
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
