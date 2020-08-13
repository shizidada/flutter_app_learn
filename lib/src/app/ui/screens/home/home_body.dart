import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/utils/navigator_util.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/screens/message/message_screen.dart';
import 'package:flutter_app_learn/src/app/ui/screens/search/search_screen.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroll/scroller_configuration_wrapper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'widgets/home_banner_swiper_view.dart';
import 'widgets/home_basic_info_view.dart';
import 'widgets/home_sliver_persistent_header_delegate.dart';
import 'widgets/home_tab_content_view.dart';

class ATHHomeBody extends StatefulWidget {
  ATHHomeBody({Key key}) : super(key: key);

  @override
  _ATHHomeBodyState createState() => _ATHHomeBodyState();
}

class _ATHHomeBodyState extends State<ATHHomeBody>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  ScrollController _homeScrollController;

  SwiperController _homeSwiperController;

  TabController _homeTabController;

  List<String> _homeTabTexts = ["关注", "推荐", "附近"];

  List<Widget> _homeTabs = <Tab>[];

  @override
  void initState() {
    _homeScrollController = ScrollController();

    _homeSwiperController = SwiperController();

    _homeScrollController
      ..addListener(() {
        int offset = _homeScrollController.offset.toInt();

        print('object $offset');
      });

    _homeTabTexts.forEach((title) => _homeTabs.add(Tab(
          text: title,
        )));

    // initialIndex 初始选中第几个
    _homeTabController =
        TabController(initialIndex: 1, length: _homeTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ATHScrollerConfigurationWrapper(child: _buildNestedScrollView());
  }

  NestedScrollView _buildNestedScrollView() {
    return NestedScrollView(
      controller: _homeScrollController,
      headerSliverBuilder: _buildHeaderSilverBuilder,
      body: _buildTabBarView(),
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: _homeTabController,
      children: _homeTabTexts
          .map((e) => ATHHomeTabContentView(
                title: e,
              ))
          .toList(),
    );
  }

  List<Widget> _buildHeaderSilverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      _buildHomeSliverAppBar(),
      SliverPersistentHeader(
        delegate: ATHHomeSliverPersistentHeaderDelegate(),
      ),
      ATHHomeBasicInfoView()
    ];
  }

  SliverAppBar _buildHomeSliverAppBar() {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () {
          ATHNavigator.pushFromRight(context, ATHSearchScreen.routeName);
        },
        icon: SvgPicture.asset('assets/icons/icon_search.svg',
            width: 44.w, height: 44.w, color: Colors.white),
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
      title: _buildHomeAppBarTitle(),
      pinned: true,
      floating: true,
      snap: true,
      expandedHeight: 300.h,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.fromLTRB(20, 40, 110, 10),
        background: _buildHomeBannerSwiperView(),
      ),
    );
  }

  Container _buildHomeAppBarTitle() {
    return Container(
        child: TabBar(
            tabs: _homeTabs,
            indicator: BoxDecoration(),
            controller: _homeTabController,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 34.sp),
            unselectedLabelColor: ATHColors.color33,
            unselectedLabelStyle: TextStyle(fontSize: 32.sp)));
  }

  Widget _buildHomeBannerSwiperView() {
    return ATHHomeBannerSwiperView(swiperController: _homeSwiperController);
  }

  @override
  bool get wantKeepAlive => true;
}
