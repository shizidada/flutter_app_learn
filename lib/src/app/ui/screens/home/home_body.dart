import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/utils/navigator_util.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/screens/message/message_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/search/search_screen.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/global_container_wrapper.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroller_configuration_wrapper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'home_banner_swiper_view.dart';

class ATHHomeBody extends StatefulWidget {
  ATHHomeBody({Key key}) : super(key: key);

  @override
  _ATHHomeBodyState createState() => _ATHHomeBodyState();
}

class _ATHHomeBodyState extends State<ATHHomeBody>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  ScrollController _scrollController;

  SwiperController _swiperController;

  TabController tabController;

  List<Widget> _homeTabs = <Tab>[];

  @override
  void initState() {
    _scrollController = ScrollController();

    _swiperController = SwiperController();

    _scrollController
      ..addListener(() {
        int offset = _scrollController.offset.toInt();

        print('object $offset');
      });

    _homeTabs = <Tab>[
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
        TabController(initialIndex: 1, length: _homeTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ATHScrollerConfigurationWrapper(
      child: NestedScrollView(
        controller: _scrollController,
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
    );
  }

  List<Widget> _silverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      _buildSliverAppBar(),
    ];
  }

  SliverAppBar _buildSliverAppBar() {
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
            margin: EdgeInsets.only(right: 24.w),
            child: SvgPicture.asset('assets/icons/icon_notice.svg',
                width: 44.w, height: 44.w, color: Colors.white),
          ),
          onTap: () {
            ATHNavigator.pushFromRight(context, ATHMessageScreen.routeName);
          },
        )
      ],
      elevation: 0,
      title: _buildAppBarTitle(),
      pinned: true,
      floating: true,
      snap: true,
      expandedHeight: 300.h,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.fromLTRB(20, 40, 110, 10),
        background: _buildBannerSwiperView(),
      ),
    );
  }

  Container _buildAppBarTitle() {
    return Container(
        child: TabBar(
            tabs: _homeTabs,
            indicator: BoxDecoration(),
            controller: tabController,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 34.sp),
            unselectedLabelColor: ATHColors.normalColor,
            unselectedLabelStyle: TextStyle(fontSize: 34.sp)));
  }

  Widget _buildBannerSwiperView() {
    return ATHHomeBannerSwiperView(swiperController: _swiperController);
  }

  @override
  bool get wantKeepAlive => true;
}
